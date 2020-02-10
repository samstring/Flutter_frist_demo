import 'dart:developer';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:FlutterDemo/view/course/categoryhome.dart';
import 'package:FlutterDemo/view/course/coursevideo.dart';
import 'package:FlutterDemo/view/course/userinfo.dart';
import 'package:FlutterDemo/view/login.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

import '../../global.dart';

class CourseDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CourseDetailPage();
  }
}

class _CourseDetailPage extends State<CourseDetailPage>
    with TickerProviderStateMixin {
  List<CourseContentModel> itemModels = List();
  CourseModel _courseModel;

  TabController _tabController;
  List<Widget> _tabPages;
  List<Widget> _tabTitles;
  int selectedIndex = 0;
  // Widget currentPage = _tabPages[selectedIndex];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(initialIndex: selectedIndex, length: 2, vsync: this);
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
    itemModels = List();

    CourseContentModel item = CourseContentModel();
    item.title = "课程标题1";
    item.itemModels = List();
    CourseContentItemModel subItem = CourseContentItemModel();
    subItem.title = "子课程";
    subItem.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item.itemModels.add(subItem);
    itemModels.add(item);

    CourseContentModel item2 = CourseContentModel();
    item2.title = "课程标题2";
    item2.itemModels = List();
    CourseContentItemModel subItem2 = CourseContentItemModel();
    subItem2.title = "子课程";
    subItem2.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item2.itemModels.add(subItem2);
    itemModels.add(item2);

    CourseContentItemModel subItem3 = CourseContentItemModel();
    subItem3.title = "子课程";
    subItem3.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item2.itemModels.add(subItem3);

    CourseContentItemModel subItem4 = CourseContentItemModel();
    subItem4.title = "子课程";
    subItem4.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item2.itemModels.add(subItem4);
    CourseContentItemModel subItem5 = CourseContentItemModel();
    subItem5.title = "子课程";
    subItem5.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item2.itemModels.add(subItem5);
    CourseContentItemModel subItem6 = CourseContentItemModel();
    subItem6.title = "子课程";
    subItem6.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
    item2.itemModels.add(subItem6);

    _courseModel = CourseModel();
    _courseModel.courseTitle = "Flutter课程Flutter课程Flutter课程";
    _courseModel.courseFor = "男女老少皆宜";
    _courseModel.courseDesc = "这是课程简介";
    _courseModel.contentModels = itemModels;
    _courseModel.favouriteCount = 100;
    _courseModel.imageUrl =
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
    _courseModel.courseDescImageList = List();
    _courseModel.courseDescImageList.add(
        "https://upload-images.jianshu.io/upload_images/6218810-f0c8fb9bc9d5e1c2.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200");
    _courseModel.courseDescImageList.add(
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
    _courseModel.courseDescImageList.add(
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
    _courseModel.courseDescImageList.add(
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
    _courseModel.courseDescImageList.add(
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");

    UserModel teacherModel = UserModel(
        userName: "张三",
        userDesc: "这个人很赖",
        avatarImageUrl:
            "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
    _courseModel.teacherMode = teacherModel;
    _tabPages = [
      CourseIntroducePage(_courseModel),
      CourseConetentPage(itemModels, true)
    ];

    // _tabPages =

    //  _tabPages = ;
    _tabTitles = [
      Tab(child: Text("介绍")),
      Tab(child: Text("目录")),
      //  Tab(child: Text("评论"))
    ];

    List<Widget> actions = [
      IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {},
      ),
    ];

    SliverToBoxAdapter a = SliverToBoxAdapter(
      child: IndexedStack(
        // sizing: StackFit.l,

        index: selectedIndex,
        children: _tabPages,
      ),
    );
    // TODO: implement build

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
                            // title: Text("你好"),
                            expandedHeight: 240,
                            pinned: true,
                            actions: actions,
                            flexibleSpace: new FlexibleSpaceBar(
                              background: Image.network(
                                _courseModel.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            ),
                            bottom: TabBar(
                              labelColor: Colors.white,
                              labelStyle: TextStyle(fontSize: 22),
                              unselectedLabelStyle: TextStyle(fontSize: 16,color: Colors.white),
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
                    bottom: 44,
                    top: 0,
                    left: 0,
                    right: 0)
                .addSubWight(
                    Flex(
                      direction: Axis.horizontal,
                    )
                        .addSubWight(FlatButton.icon(
                          color: GlobalTool.mainColor,
                          icon: Icon(Icons.chat),
                          textColor: Colors.white,
                          label: Text("咨询"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {},
                        ).putIntoContainer(
                            margin: EdgeInsets.only(left: 5, right: 5),
                            width: 100))
                        .addSubWight(
                            FlatButton.icon(
                              textColor: Colors.white,
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              icon: Icon(Icons.add),
                              label: Text("上课"),
                              onPressed: () {},
                            ).putIntoContainer(
                                margin: EdgeInsets.only(right: 5)),
                            flex: 1)
                        .putIntoContainer(height: 44, width: double.infinity),
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

//
class CourseIntroducePage extends StatelessWidget {
  CourseModel _courseModel;

  CourseIntroducePage(CourseModel courseModel) {
    _courseModel = courseModel;
  }

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      key: PageStorageKey("class_Indtroduce"),
      slivers: <Widget>[
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverToBoxAdapter(
          child: Column()
              .addSubWight(Text(
                _courseModel.courseTitle == null
                    ? ""
                    : _courseModel.courseTitle,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ).putIntoContainer(
                  width: double.infinity,
                  height: 30,
                  margin: EdgeInsets.only(top: 10)))
              .addSubWight(Text(
                _courseModel.favouriteCount == null
                    ? ""
                    : _courseModel.favouriteCount.toString() + " 人收藏",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13),
              ).putIntoContainer(
                  width: double.infinity,
                  height: 30,
                  margin: EdgeInsets.only(top: 10)))
              .addSubWight(getSection("简介", getIntroduce(_courseModel))
                  .putIntoContainer(margin: EdgeInsets.only(bottom: 20)))
              .addSubWight(getSection(
                  "适合人群",
                  Text(_courseModel.courseFor == null
                      ? ""
                      : _courseModel.courseFor)))
              .addSubWight(
                  getSection("老师", UserInfoItem(_courseModel.teacherMode)))
              .putIntoContainer(padding: EdgeInsets.only(left: 10, right: 10)),
        )
      ],
    );
    
  }

  Column getSection(String title, Widget widget) {
    return Column()
        .addSubWight(Text(
          title,
          style: TextStyle(fontSize: 20),
        ).putIntoContainer(width: double.infinity, height: 30))
        .addSubWight(widget.putIntoContainer(
            width: double.infinity, margin: EdgeInsets.only(bottom: 20)));
  }

  Column getIntroduce(CourseModel courseModel) {
    Column descView = Column(
      
    ).addSubWight(Text(
      courseModel.courseDesc == null ? "" : courseModel.courseDesc,
      style: TextStyle(fontSize: 18),
    ).putIntoContainer(width: double.infinity));
    if (courseModel.courseDescImageList != null) {
      for (var i = 0; i < courseModel.courseDescImageList.length; i++) {
        descView = descView.addSubWight(
            Image.network(courseModel.courseDescImageList[i])
                .putIntoContainer(width: double.infinity));
      }
    }

    return descView;
  }
}

class CourseConetentPage extends StatefulWidget {
  List<CourseContentModel> _itemModels;
  bool isShowInSliverList;

  CourseConetentPage(
      List<CourseContentModel> itemModels, bool isShowInSliverList) {
    _itemModels = itemModels;
    this.isShowInSliverList = isShowInSliverList;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourseConetentPage(_itemModels);
  }
}

class _CourseConetentPage extends State<CourseConetentPage> with AutomaticKeepAliveClientMixin{
  List<CourseContentModel> _itemModels;
  List<Item> _data;


  _CourseConetentPage(List<CourseContentModel> itemModels) {
    _itemModels = itemModels;
    // this.isShowInSliverList = isShowInSliverList;
  }

  @override
  void initState() {
    super.initState();
    _data = generateItems(_itemModels.length);
    log("重新1");
  }

  @override
  Widget build(BuildContext context) {
    log("重新2");
    return CustomScrollView(
      key: PageStorageKey("class_group"),
      slivers: <Widget>[
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverToBoxAdapter(
          child: _buildPanel(),
        )
      ],
    );
  }

  List<Item> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Item(courseMoel: _itemModels[index]);
    });
  }

  List<CourseContentItemModel> getSubItem(CourseContentModel contentModel) {
    return contentModel.itemModels;
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      // key: GlobalKey(),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.courseMoel.title),
            );
          },
          body: Column(
              children: getSubItem(item.courseMoel)
                  .map((CourseContentItemModel subItem) {
            return Column()
                .addSubWight(Row()
                    .addSubWight(Icon(Icons.video_library))
                    .addSubWight(Text(
                      subItem.title == null ? "" : subItem.title,
                      style: TextStyle(fontSize: 15),
                    ).putIntoContainer(margin: EdgeInsets.only(left: 5)))
                    .putIntoContainer(
                        width: double.infinity,
                        height: 60,
                        padding: EdgeInsets.only(left: 15)))
                .addSubWight(Container(
                  color: Colors.black12,
                  height: 1,
                  margin: EdgeInsets.only(left: 15, right: 20),
                ))
                .putIntoContainer(color: Colors.white)
                .putIntoGeustureDetector(GestureDetector(
              onTapDown: (event) {
                //  String url = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return VideoScreen(
                    url: subItem.videoUrl,
                  );
                }));
              },
            ));
          }).toList()),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class Item {
  Item({this.isExpanded = false, this.courseMoel});

  bool isExpanded;
  CourseContentModel courseMoel;
}
