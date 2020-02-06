import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/view/course/categorydetail.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:FlutterDemo/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sfviewtool/sfviewtool.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


CourseModel model = CourseModel();
          model.courseTitle = "大数据 flutter学习";
          model.imageUrl = "https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70";
          model.courseDesc = "内容";
          List<CourseModel> models = List();
          models.add(model);

    // TODO: implement build
    return RefreshIndicator(
      child:  CustomScrollView(
      // key: PageStorageKey("home"),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: getHeaderBanner().putIntoContainer(height: 200),
        ),
        SliverToBoxAdapter(
          child: getCategoryView().putIntoContainer(margin: EdgeInsets.only(top: 15,bottom: 10)),
        ),
        SliverToBoxAdapter(
          // child: getList("精选课程",models),
          child: Text("精选课程",style: TextStyle(fontSize: 18),).putIntoContainer(width:double.infinity,height:30,margin: EdgeInsets.only(left: 10)),
        ),
        getList(models),
      ],
    ).putInfoSaveArea(top: true),
    onRefresh: (){
      
    },
    );

    // return CustomScrollView(
    //   // key: PageStorageKey("home"),
    //   slivers: <Widget>[
    //     SliverToBoxAdapter(
    //       child: getHeaderBanner().putIntoContainer(height: 200),
    //     ),
    //     SliverToBoxAdapter(
    //       child: getCategoryView().putIntoContainer(margin: EdgeInsets.only(top: 15,bottom: 10)),
    //     ),
    //     SliverToBoxAdapter(
    //       // child: getList("精选课程",models),
    //       child: Text("精选课程",style: TextStyle(fontSize: 18),).putIntoContainer(width:double.infinity,height:30,margin: EdgeInsets.only(left: 10)),
    //     ),
    //     getList(models),
    //   ],
    // ).putInfoSaveArea(top: true);
  }

  Widget getHeaderBanner(){
    
     return Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70",fit: BoxFit.fill,);
        },
        itemCount: 3,
        autoplay: true,
        pagination: new SwiperPagination(),
        control: new SwiperControl(iconPrevious: null,iconNext: null),
      );
  }

  Widget getCategoryView(){
    return Flex(direction: Axis.horizontal)
    .addSubWight(getCategoryItem("IT","ITquanxian"),flex: 1)
    .addSubWight(getCategoryItem("外语","yuyannengli"),flex: 1)
    .addSubWight(getCategoryItem("产品运营","chanpin"),flex: 1)
    .addSubWight(getCategoryItem("办公效率","bangong"),flex: 1)
    .addSubWight(getCategoryItem("设计创意","shejitu"),flex: 1)
    // .addSubWight(getCategoryItem(),flex: 1)
    .putIntoContainer(width: double.infinity,height: 80);
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
          // Navigator.pushNamed(context, "coursePage");
          
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context){
              return Container(
                height: double.infinity,
                child: CourseloginPage(),
              );

            }
          );
        }));
      },
      childCount: 10
      )
    );
  }         

  
}