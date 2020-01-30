import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/view/course/categorydetail.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';
class MyCoursePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


CourseModel model = CourseModel();
          model.courseTitle = "大数据 flutter学习";
          model.imageUrl = "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
          model.courseDesc = "内容";
          List<CourseModel> models = List();
          models.add(model);

    // TODO: implement build
    return CustomScrollView(
      // key: PageStorageKey("home"),
      slivers: <Widget>[
        
        SliverToBoxAdapter(
          // child: getList("精选课程",models),
          child: Text("最近观看",style: TextStyle(fontSize: 18),).putIntoContainer(width:double.infinity,height:30,margin: EdgeInsets.only(left: 10)),
        ),
        getList(models),
        
        SliverToBoxAdapter(
          // child: getList("精选课程",models),
          child: Text("所有课程",style: TextStyle(fontSize: 18),).putIntoContainer(width:double.infinity,height:30,margin: EdgeInsets.only(left: 10)),
        ),
        getList(models),
      ],
    );
  }

 

  Widget getCategoryItem(String title,String imageName){
    return Column().addSubWight(
      Image(
        image: AssetImage("assets/images/"+imageName+".png"),
        width: 50,
        height: 50,
        
      ).putIntoContainer())
      .addSubWight(Container(height: 5,width: double.infinity,))
      .addSubWight(Text(title,style: TextStyle(fontSize: 13),))
      .putIntoContainer(width: 50,height: 80);
  }


  Widget getList(List<CourseModel> models){
   return SliverFixedExtentList(
      itemExtent: 80,
      delegate:  SliverChildBuilderDelegate((BuildContext context, int index){
        return  CourseListItemView(models[0]).putIntoGeustureDetector(GestureDetector(
        onTapDown:(event){
          // log("点击第$index");
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CourseDetailPage();
          }));
       
        }));
      },
      childCount: 3
      )
    );
  }         

  
}