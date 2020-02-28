import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/view/sarchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sfviewtool/sfviewtool.dart';

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
    _tabPages = [CourseList(), CourseList()];
  }

  @override
  Widget build(BuildContext context) {
    _tabTitles = [
      Tab(
          child: Text(
        "推荐",
        style: TextStyle(color: Colors.black,backgroundColor: Colors.white),
      )),
      Tab(
        child: Text(
          "热门",
          style: TextStyle(color: Colors.black),
        ),
      ),
      //  Tab(child: Text("评论"))
    ];
    CourseModel model = CourseModel();
    model.courseTitle = "大数据 flutter学习";
    model.imageUrl =
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
    model.courseDesc = "内容";
    List<CourseModel> models = List();
    models.add(model);

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
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70",
          fit: BoxFit.fill,
        );
      },
      itemCount: 3,
      autoplay: true,
      pagination: new SwiperPagination(margin: EdgeInsets.only(bottom: 50)),
      control: new SwiperControl(iconPrevious: null, iconNext: null),
    );
  }

  Widget getCategoryView() {
    return Column().addSubWight(
      Flex(direction: Axis.horizontal)
        .addSubWight(getCategoryItem("IT", "ITquanxian"), flex: 1)
        .addSubWight(getCategoryItem("外语", "yuyannengli"), flex: 1)
        .addSubWight(getCategoryItem("产品运营", "chanpin"), flex: 1)
        .addSubWight(getCategoryItem("办公效率", "bangong"), flex: 1)
        .addSubWight(getCategoryItem("设计创意", "shejitu"), flex: 1)
        // .addSubWight(getCategoryItem(),flex: 1)
        .putIntoContainer(
          width: double.infinity,
        )
    ).addSubWight(Container(height:10))
    .addSubWight(
      Flex(direction: Axis.horizontal)
        .addSubWight(getCategoryItem("IT", "ITquanxian"), flex: 1)
        .addSubWight(getCategoryItem("外语", "yuyannengli"), flex: 1)
        .addSubWight(getCategoryItem("产品运营", "chanpin"), flex: 1)
        .addSubWight(getCategoryItem("办公效率", "bangong"), flex: 1)
        .addSubWight(getCategoryItem("设计创意", "shejitu"), flex: 1)
        // .addSubWight(getCategoryItem(),flex: 1)
        .putIntoContainer(
          width: double.infinity,
        )
    );
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
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourseList();
  }
}

class _CourseList extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    CourseModel model = CourseModel();
    model.courseTitle = "大数据 flutter学习";
    model.imageUrl =
        "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
    model.courseDesc = "内容";
    List<CourseModel> models = List();
    models.add(model);
    models.add(model);
    models.add(model);
    models.add(model);
    models.add(model);
    models.add(model);

    return CustomScrollView(
      // key: PageStorageKey("home"),
      slivers: <Widget>[
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        getList(models),
      ],
    );
    // return getList(models);
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
        .addSubWight(Image.network(
          model.imageUrl,
          fit: BoxFit.fill,
        ).putIntoContainer(padding: EdgeInsets.all(5)),left: 0,right: 0,top: 0,bottom: 0)
        .addSubWight(Text(model.courseTitle).putIntoContainer(
          color: Colors.white,
            // margin: EdgeInsets.only(top: 8),
            alignment: Alignment.topLeft,
            height: 30,
            padding: EdgeInsets.only(left: 8, right: 8,bottom: 0)),bottom: 0,left: 0,right: 0)
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
        // Navigator.pushNamed(context, "coursePage");
         Navigator.pushNamed(context, "ChatPage");
      },
    ));
  }
}
