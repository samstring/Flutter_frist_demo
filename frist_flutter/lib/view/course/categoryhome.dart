import 'dart:developer';

import 'package:FlutterDemo/model/course/coursecategorymodel.dart';
import 'package:FlutterDemo/view/course/categorypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'package:FlutterDemo/tool/categaory_view/lib/category_view_tool.dart';

class CategoryPageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageHome();
  }

  // CategoryPageHome({Key key}){
  //   this.key = key;
  // }
  
}

class _CategoryPageHome extends State<CategoryPageHome>{
  List<CategoryLeftItemModel> _titles;
  List<CategoryRightModel> _subItems;
  String listKey;
  @override
  Widget build(BuildContext context) {
  List leftList = List();
    for (var i = 0; i < 10; i++) {
      leftList.add("分类"+i.toString());
    }

    List rightList = List();
    for (var i = 0; i < 3; i++) {
      rightList.add(0.toString());
    }

CategoryViewTool categoryView;
     categoryView = CategoryViewTool(
      key: Key(listKey),
        leftViewList: leftList,
        rightViewList: rightList,
        
        leftItemBuilder: (BuildContext context,List itemList,int index,bool isSelect){
          if(isSelect){
            Stack content = Stack().
            addSubWight(Container(color: Colors.red,width: 5,height: 20,),left: 0,top: 20)
            .addSubWight(Center(child: Text(itemList[index])),left: 10,top: 20);

            Stack item = Stack()
            .addSubWight(content.putIntoContainer(height:60))
            .addSubWight(Container(height: 1,width: double.infinity,color: Colors.black12,),bottom: 0,left: 0,right: 0);

            return item.putIntoContainer(height: 60,color: Colors.white);
          
          }else{
                 Stack item = Stack()
            .addSubWight(Center(child: Text(itemList[index])).putIntoContainer(height:60),left: 10)
            .addSubWight(Container(height: 1,width: double.infinity,color: Colors.black12,),bottom: 0,left: 0,right: 0);

            return item.putIntoContainer(height: 60,color: Colors.white);
          }
        },
        

        rightViewHeaderBuilder:(BuildContext context){
          return Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("https://img-blog.csdnimg.cn/20190902174921871.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L01yc19jaGVucw==,size_16,color_FFFFFF,t_70",fit: BoxFit.fill,);
        },
        itemCount: 3,
        autoplay: true,
        pagination: new SwiperPagination(),
        control: new SwiperControl(iconPrevious: null,iconNext: null),
        ).putIntoContainer(margin: EdgeInsets.only(left: 10,top:5,right: 10,bottom: 20),height: 100);
        },

        rightItemBuilder: (BuildContext context,List itemList,int index){         
         Column content = Column(crossAxisAlignment: CrossAxisAlignment.start,);
         content = content.addSubWight(Text(itemList[index]).putIntoContainer(height:30));
       
        Wrap itemContent = Wrap(spacing: 10,runSpacing: 10,);
        for (var i = 0; i < rightList.length; i++) {
          // log(rightList.toString());
          LayoutBuilder item =LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
            return  Column()
         .addSubWight(Image(image:AssetImage("assets/images/ITquanxian.png"),fit: BoxFit.contain,width: constraints.maxWidth/3-10,height: 70))
         .addSubWight(Center(child: Text("title"+i.toString()),).putIntoContainer(height: 30,width: 70));
          },);
        
          itemContent =itemContent.addSubWight(item);
        }
        content = content.addSubWight(itemContent);

        return content.putIntoContainer(width: double.infinity,margin: EdgeInsets.all(10));
          
        },
        clickLeftItem: (context,itemList,index){
          rightList = List();
          for (var i = 0; i < 10; i++) {
            rightList.add("分类"+index.toString()+"的分区"+i.toString());
          }
          
          categoryView.updateRightList(rightList);
          

          setState(() {
            // log(rightList.toString());
            listKey = index.toString();
          });
          
        },
      );

    // TODO: implement build
    log(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      // appBar:AppBar(
      //   title:Text("重置密码"),
      // ),
      body:categoryView.putInfoSaveArea()
      
    );
  }

}