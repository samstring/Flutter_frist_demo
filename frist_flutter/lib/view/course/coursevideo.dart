import 'dart:developer';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/global.dart';
import 'package:FlutterDemo/model/course/category_model.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:sfviewtool/sfviewtool.dart';

import 'coursedetail.dart';



class VideoScreen extends StatefulWidget {
   final String url;

  const VideoScreen({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VideoScreenState(url);
  }
    

}

class _VideoScreenState extends State<VideoScreen> {

final String url;
VideoPlayerController videoPlayerController;

 ChewieController chewieController;

Chewie playerWidget;

 bool initialized = false;

 VideoCategoryModel _courseModel;

_VideoScreenState(this.url);



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(url)..initialize().then((_){
      // log(url);
      // initialized=true;
      // setState(() {
        
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
  // log(url);


   List itemModels = List();

//     CourseContentModel item = CourseContentModel();
//     item.title = "课程标题1";
//     item.itemModels = List();
//     CourseContentItemModel subItem = CourseContentItemModel();
//     subItem.title = "子课程";
//     subItem.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
//     item.itemModels.add(subItem);
//     itemModels.add(item);

//  VideoCategoryModel item2 = CourseContentModel();
//     item2.title = "课程标题2";
//     item2.itemModels = List();
//     CourseContentItemModel subItem2 = CourseContentItemModel();
//     subItem2.title = "子课程";
//     subItem2.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
//     item2.itemModels.add(subItem2);
//     itemModels.add(item2);

//     CourseContentItemModel subItem3 = CourseContentItemModel();
//     subItem3.title = "子课程";
//     subItem3.videoUrl = "https://www.w3cschool.cn/statics/demosource/movie.mp4";
//     item2.itemModels.add(subItem3);
 

//    _courseModel = CourseModel();
//     _courseModel.title = "Flutter课程Flutter课程Flutter课程";
//     _courseModel.courseFor = "男女老少皆宜";
//     _courseModel.videoInfo = "这是课程简介";
//     _courseModel.contentModels = itemModels;
//     _courseModel.favouriteCount = 100;
//     _courseModel.videoUrlAdress = "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
//     _courseModel.courseDescImageList = List();
//     _courseModel.courseDescImageList.add("https://upload-images.jianshu.io/upload_images/6218810-f0c8fb9bc9d5e1c2.png?imageMogr2/auto-orient/strip|imageView2/2/w/1200");
//     _courseModel.courseDescImageList.add("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
//     _courseModel.courseDescImageList.add("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
//     _courseModel.courseDescImageList.add("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");
//     _courseModel.courseDescImageList.add("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70");

  
  chewieController = ChewieController(
  videoPlayerController: videoPlayerController,
  aspectRatio: 3 / 2,
  autoPlay: false,
  looping: false,
   materialProgressColors: new ChewieProgressColors(
            playedColor: Colors.red,
            handleColor: Colors.blue,
            backgroundColor: Colors.grey,
            bufferedColor: Colors.lightGreen,
        ),
);
    playerWidget = Chewie(
  controller: chewieController,
);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("视频播放"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share,color: Colors.white,),
          )
        ],
        
      ),
      body: Column().addSubWight(
playerWidget.putIntoContainer(width: double.infinity,height: 200)
      )
      .addSubWight(Container(color:Colors.white,height:10,width:double.infinity))
      .addSubWight(getAction(context))
      .addSubWight(Container(color:Colors.black12,height:10,width:double.infinity))
      .addSubWight(CourseConetentPage(itemModels,false))
    );
  }

  Widget getAction(BuildContext context){
    return Flex(direction: Axis.horizontal,).addSubWight(
      FlatButton.icon(
          color:Colors.orange,
          icon: Icon(Icons.favorite),
          textColor: Colors.white,
          label: Text("收藏"),
           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: (){

          },
        ).putIntoContainer(margin: EdgeInsets.only(left: 5,right: 5))
    ,flex: 1)
    .addSubWight(
      FlatButton.icon(
          color: GlobalTool.mainColor,
          icon: Icon(Icons.chat),
          textColor: Colors.white,
          label: Text("咨询老师"),
           shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: (){

          },
        ).putIntoContainer(margin: EdgeInsets.only(left: 5,right: 5))
        ,flex: 1
    )
    .putIntoContainer(width: double.infinity)
    ;
  }

  @override
void dispose() {
  videoPlayerController.dispose();
  chewieController.dispose();
  super.dispose();
}
}