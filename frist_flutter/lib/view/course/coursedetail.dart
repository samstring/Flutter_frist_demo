import 'dart:developer';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/course_content_model.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:FlutterDemo/tool/loading_view.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/view/course/categoryhome.dart';
import 'package:FlutterDemo/view/course/coursevideo.dart';
import 'package:FlutterDemo/view/course/userinfo.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'dart:convert' as convert;
import '../../global.dart';

class CourseDetailPage extends StatefulWidget {
  // final CourseModel courseModel;
  final String courseId;

  const CourseDetailPage({Key key, this.courseId}) : super(key: key);

  // const CourseDetailPage({Key key, this.courseModel}) : super(key: key);
  
  
  @override
  State<StatefulWidget> createState() {
    return _CourseDetailPage(this.courseId);
  }
}

class _CourseDetailPage extends State<CourseDetailPage>
    with TickerProviderStateMixin {
  List<CourseContentModel> itemModels = List();
  // CourseModel _courseModel;

  TabController _tabController;
  List<Widget> _tabPages;
  List<Widget> _tabTitles;
  int selectedIndex = 0;
  bool isFristLoad = true;
  bool isLikeVideo = false;

   CourseModel courseModel;
   UserModel teacherModel;

  final String courseId;

  _CourseDetailPage(this.courseId);

  


  getCourseInfo(String courseId){
    UserTool.getUserInfo().then((user){
       NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          CourseModel model = CourseModel.fromJson(map["result"]['video_info']);
          this.courseModel = model;
          this.teacherModel = UserModel.fromJson(map["result"]["teacher"]);
          int likeState = map["result"]["isLike"];
          if(likeState == 1){
            isLikeVideo = true;
          }else{
            isLikeVideo = false;
          }
          setState(() {
        //  this.hotSearchList = result;
          });
        }
      } else {
      
      }
    };
    netWorkTool.post(video_detail_info, {
      "videoId":this.courseId,
      "user.bbToken.b_tokenString":user.bbToken.bTokenString == null ?"":user.bbToken.bTokenString,
      "user.b_Id":user.bId == null ? "":user.bId
    });
    });
  }

  likeVideo(bool isLike){
     UserTool.getUserInfo().then((user){
       NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          
          this.isLikeVideo = !isLikeVideo;
          setState(() {
          });
        }
      } else {
      
      }
    };
    String url = null;
    if(isLike){
      url = like_video_url;
    }else{
      url = unLike_video_url;
    }
    netWorkTool.post(url, {
      "videoModel.b_Id":this.courseId,
      "user.bbToken.b_tokenString":user.bbToken.bTokenString == null ?"":user.bbToken.bTokenString,
      "user.b_Id":user.bId == null ? "":user.bId
    });
    });
  }

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
      if (this.isFristLoad == true) {
      getCourseInfo(this.courseId);
      this.isFristLoad = false;
    }

    if (this.courseModel == null) {
      return Scaffold(
        body: Center(
          child: LoadingDialog(),
        ),
      );
    }

  


    itemModels = List();

    CourseContentModel item = CourseContentModel();
   
    // UserModel teacherModel = UserModel(
    //     userName: "张三",
    //     userDesc: "这个人很赖",
    //     avatarImageUrl:
    //         "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
    
    _tabPages = [
      CourseIntroducePage(this.courseModel,this.teacherModel),
      CourseConetentPage(itemModels, true)
    ];

    // _tabPages =

    //  _tabPages = ;
    _tabTitles = [
      // Container(child: Text("介绍",style: TextStyle(color: Colors.black,backgroundColor: Colors.white),),color: Colors.red,width: 100,),
      Tab(
          child: Text(
        "介绍",
        style: TextStyle(color: Colors.black),
      )),
      Tab(
          child: Text(
        "目录",
        style: TextStyle(color: Colors.black),
      )),
      //  Tab(child: Text("评论"))
    ];

    List<Widget> actions = [
      IconButton(
        icon: Icon(
          Icons.favorite,
          color: this.isLikeVideo ? Colors.red:Colors.grey
        ),
        onPressed: () {
          this.likeVideo(!this.isLikeVideo);
        },
      ),
      IconButton(
        icon: Icon(
          Icons.share,
          color: Colors.grey,
        ),
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
                            leading: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            backgroundColor: Colors.white,
                            
                            centerTitle: true,
                            title: Text(
                              "课程详情",
                              style: TextStyle(color: Colors.grey),
                            ),
                            expandedHeight: 240,
                            pinned: true,
                            actions: actions,
                            flexibleSpace: new FlexibleSpaceBar(
                              background: Image.network(
                                courseModel.coverImageUrl,
                                fit: BoxFit.fill,
                              ),
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
  UserModel teacherMdoel;

  CourseIntroducePage(CourseModel courseModel,UserModel teacher) {
    _courseModel = courseModel;
    teacherMdoel = teacher;
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
                _courseModel.title == null
                    ? ""
                    : _courseModel.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ).putIntoContainer(
                  width: double.infinity,
                  height: 30,
                  margin: EdgeInsets.only(top: 10)))
              .addSubWight(Text(
                _courseModel.likeCount == null
                    ? ""
                    : _courseModel.likeCount.toString() + " 人收藏",
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
                  Text(_courseModel.title == null
                      ? ""
                      : _courseModel.title)))
              .addSubWight(
                  getSection("老师", UserInfoItem(teacherMdoel)))
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
    Column descView = Column().addSubWight(Text(
      courseModel.videoInfo == null ? "" : courseModel.videoInfo,
      style: TextStyle(fontSize: 18),
    ).putIntoContainer(width: double.infinity));
    if (courseModel.videoImages != null) {
      for (var i = 0; i < courseModel.videoImages.length; i++) {
        descView = descView.addSubWight(
            Image.network(courseModel.videoImages[i].imageUrl)
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

class _CourseConetentPage extends State<CourseConetentPage>
    with AutomaticKeepAliveClientMixin {
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
                .putIntoGestureDetector(GestureDetector(
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
