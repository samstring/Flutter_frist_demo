import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:FlutterDemo/view/sarchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'dart:convert' as convert;
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tabPages;
  List<Widget> _tabTitles;
  int selectedIndex = 0;
  List<CourseModel> bannerModels = List();

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
    _tabPages = [CourseList(0), CourseList(1)];
  }

  void loadBannerData(BuildContext context) {
    NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          List resultList = (map["result"]);
          List<CourseModel> models = List();
          for (int i = 0; i < resultList.length; i++) {
            CourseModel model = CourseModel.fromJson(resultList[i]);
            models.add(model);
          }
           this.bannerModels = models;
          setState(() {
         
          });
        }
      } else {
      
      }
    };
    netWorkTool.post(banner_url, {
    });
  }

  @override
  Widget build(BuildContext context) {
    if(bannerModels.length <= 0){
      loadBannerData(context);
    }
    _tabTitles = [
      Tab(
          child: Text(
        "推荐",
        style: TextStyle(color: Colors.black, backgroundColor: Colors.white),
      )),
      Tab(
        child: Text(
          "热门",
          style: TextStyle(color: Colors.black),
        ),
      ),
      //  Tab(child: Text("评论"))
    ];
    

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverAppBar(
                    backgroundColor: Colors.white,
                    title: TextFileWidget(),
                    expandedHeight: 370,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack()
                          .addSubWight(
                              getHeaderBanner().putIntoContainer(height: 220))
                          .addSubWight(
                              getCategoryView().putIntoContainer(
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, right: 10, bottom: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 4.0)
                                      ]),
                                  height: 180),
                              bottom: 20,
                              left: 10,
                              right: 10)
                          .putIntoContainer(
                              height: 320, margin: EdgeInsets.only(bottom: 40)),
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
          )),
    );
  }

  Widget getHeaderBanner() {
    Widget bannberWidght;
    if (bannerModels.length > 0) {
      bannberWidght = Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          bannerModels[index].coverImageUrl,
          fit: BoxFit.fill,
        );
      },
      itemCount: bannerModels.length,
      autoplay: true,
      pagination: new SwiperPagination(margin: EdgeInsets.only(bottom: 50)),
      control: bannerModels.length > 0 ? new SwiperControl(iconPrevious: null, iconNext: null):null,
    );
      
    }else{
      bannberWidght = Container();
    }
    return bannberWidght;
  }

  Widget getCategoryView() {
    return Column()
        .addSubWight(Flex(direction: Axis.horizontal)
            .addSubWight(getCategoryItem("IT", "ITquanxian"), flex: 1)
            .addSubWight(getCategoryItem("外语", "yuyannengli"), flex: 1)
            .addSubWight(getCategoryItem("产品运营", "chanpin"), flex: 1)
            .addSubWight(getCategoryItem("办公效率", "bangong"), flex: 1)
            .addSubWight(getCategoryItem("设计创意", "shejitu"), flex: 1)
            // .addSubWight(getCategoryItem(),flex: 1)
            .putIntoContainer(
              width: double.infinity,
            ))
        .addSubWight(Container(height: 10))
        .addSubWight(Flex(direction: Axis.horizontal)
            .addSubWight(getCategoryItem("烘焙", "huabanfuben"), flex: 1)
            .addSubWight(getCategoryItem("读书", "shuben"), flex: 1)
            .addSubWight(getCategoryItem("电影", "dianying"), flex: 1)
            .addSubWight(getCategoryItem("音乐", "yinle"), flex: 1)
            .addSubWight(getCategoryItem("运动", "yundongxie"), flex: 1)
            // .addSubWight(getCategoryItem(),flex: 1)
            .putIntoContainer(
              width: double.infinity,
            ));
  }

  Widget getCategoryItem(String title, String imageName) {
    return Column()
        .addSubWight(Image(
          image: AssetImage("assets/images/" + imageName + ".png"),
          width: 50,
          height: 50,
        ).putIntoContainer())
        .addSubWight(Container(
          height: 5,
          width: double.infinity,
        ))
        .addSubWight(Text(
          title,
          style: TextStyle(fontSize: 13),
        ))
        .putIntoContainer(width: 50, height: 80);
  }
}

class CourseList extends StatefulWidget {
  final int courseType;

  CourseList(this.courseType);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourseList(courseType);
  }
}

class _CourseList extends State<CourseList> with AutomaticKeepAliveClientMixin{
  List<CourseModel> models = List();
  Set<String> modelsSet = Set();
  EasyRefresh content;
  EasyRefreshController refreshController = EasyRefreshController();
  bool isFristLoad = true;
  int pageIndex=0;
  int pageCount=10;

  final int courseType;//0推荐 1 热门

  _CourseList(this.courseType);

  void loadData(BuildContext context) {
    NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      ScaffoldState _state =
          context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          List resultList = (map["result"]);
          
          for (int i = 0; i < resultList.length; i++) {
            CourseModel model = CourseModel.fromJson(resultList[i]);

            if (this.modelsSet.contains(model.bId)) {
            } else {
              models.add(model);
              modelsSet.add(model.bId);
            }
          }
          setState(() {
            if(resultList.length<10){
            pageCount = pageIndex-1;
          }
          });
        } else {
          // _state.showSnackBar(
          //   SnackBar(
          //     content: Text(map['error'].toString()),
          //   ),
          // );
        }
      } else {
        //调用ScaffoldState的showSnackBar来弹出SnackBar
        _state.showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      }
    };
    if (this.courseType == 1) {
      UserTool.getUserInfo().then((userModel){
 netWorkTool.post(recomendVideo_url, {
      "index":pageIndex.toString(),
      "pageCount":pageCount.toString(),
   
                             
    });
      });
     
    }
    if(this.courseType == 0){
netWorkTool.post(hotVideo_url, {
      "index":pageIndex.toString(),
      "pageCount":pageCount.toString()
    });
    }
    
  }

  
  @override
  Widget build(BuildContext context) {
    // 
    if (this.isFristLoad) {
      // refreshController.callLoad();
      // setState(() {
        loadData(context);
        this.isFristLoad = false;
       
      // });
    
    }

    content = EasyRefresh(
      key: PageStorageKey(this.courseType),
      controller: refreshController,
      child: CustomScrollView(
        // key: PageStorageKey("home"),
        slivers: <Widget>[
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          getList(models),
        ],
      ),
      onRefresh: null,
      onLoad: () async {
        setState(() {
          pageIndex = pageIndex+1;
          loadData(context);
           
        });
      },
      firstRefreshWidget: Container(),
    );
    return this.models.length == 0 ? Container():content;
  }

  Widget getList(List<CourseModel> models) {
    // print()
    return SliverGrid.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0,
      mainAxisSpacing: 8,
      childAspectRatio: 1.1,
      children: models.map((model) => getItem(model)).toList(),
    );
  }

  Widget getItem(CourseModel model) {
    return Stack()
        .addSubWight(
            Image.network(
              model.coverImageUrl == null ? "" : model.coverImageUrl,
              fit: BoxFit.fitHeight,
              loadingBuilder: (context,widght,event){
                // return Text("loading");
                
                if ( event == null) {
                  return widght;
                }else{
                  return SizedBox(
 width: 100,
 height: 40,
  child: Shimmer.fromColors(
    baseColor: Colors.red,
    highlightColor: Colors.yellow,
    child: Text(
      'Shimmer',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight:
        FontWeight.bold,
      ),
    ),
  ),
);
                }
                
              },
            ).putIntoContainer(padding: EdgeInsets.all(5)),
            left: 0,
            right: 0,
            top: 0,
            bottom: 0)
        .addSubWight(
            Text(model.title).putIntoContainer(
                color: Colors.white,
                // margin: EdgeInsets.only(top: 8),
                alignment: Alignment.topLeft,
                height: 30,
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 0)),
            bottom: 0,
            left: 0,
            right: 0)
        .putIntoContainer(
            // padding: EdgeInsets.all(5),
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //           color: Colors.black12,
            //           offset: Offset(2.0, 2.0),
            //           blurRadius: 4.0)
            //     ])
            )
        .putIntoGestureDetector(GestureDetector(
      onTapDown: (event) {
        Navigator.pushNamed(context, "coursePage",arguments: {"courseId":model.bId});
        // Navigator.pushNamed(context, "ChatPage");
      },
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
