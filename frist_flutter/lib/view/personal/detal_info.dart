import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

import '../../global.dart';

class DetailInfo extends StatefulWidget{
  
  final List<Widget> tabPages;
  final List<Widget> tabTitles;
  final int intinialSelectedIndex;
  final List<Widget> actions;
  final Widget pageTitle;
  final Widget headerView;
  final Widget bottomView;
   _DetailInfo  __detailInfo;

   DetailInfo({Key key,  this.tabPages, this.tabTitles,this.intinialSelectedIndex, this.actions, this.pageTitle, this.headerView, this.bottomView}) : super(key: key){
     __detailInfo = _DetailInfo(tabTitles,tabPages , intinialSelectedIndex, actions, pageTitle, headerView, bottomView);
   }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __detailInfo;
  }
}

class _DetailInfo extends State<DetailInfo>
    with TickerProviderStateMixin {
  
   TabController _tabController;
  final List<Widget> _tabPages;
  final List<Widget> _tabTitles;
   int selectedIndex;
  final List<Widget> actions;
  final Widget pageTitle;
  final Widget headerView;
  final Widget bottomView;

  _DetailInfo( this._tabTitles, this._tabPages, this.selectedIndex, this.actions, this.pageTitle, this.headerView, this.bottomView);


  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(initialIndex: selectedIndex, length: _tabPages.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        //判断TabBar是否切换
        setState(() {
          selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    


    return Scaffold(
            body: Stack()
                .addSubWight(
                    NestedScrollView(
                      headerSliverBuilder: (context, innerScrolled) => <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          child: SliverAppBar(
                            leading: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            
                            
                            centerTitle: true,
                            title:pageTitle == Container() ?"":pageTitle,
                            expandedHeight: 300,
                            pinned: true,
                            actions: actions,
                            flexibleSpace: new FlexibleSpaceBar(
                              background: headerView == null ? Container():headerView
                            ),
                            bottom: TabBar(
                              labelColor: Colors.white,
                              labelStyle: TextStyle(fontSize: 22),
                              unselectedLabelStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              unselectedLabelColor: Colors.white,
                              tabs: _tabTitles,
                              controller: _tabController,
                            ),
                          ),
                        )
                      ],
                      body: TabBarView(
                        controller: _tabController,
                        children: _tabPages,
                      ),
                    ).putIntoContainer(),
                    bottom: bottomView == null ?0:44,
                    top: 0,
                    left: 0,
                    right: 0)
                .addSubWight(
                    bottomView == null ? Container():bottomView,
                    bottom: 0,
                    left: 0,
                    right: 0) //()
            )
        .putIntoContainer(height: double.infinity)
        .putInfoSaveArea(top: false);
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar.putIntoContainer(color: Colors.white),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

