import 'dart:developer';

import 'package:flutter/material.dart';
import 'category_view_tool.dart';
import 'package:sfviewtool/sfviewtool.dart';
class CategoryViewExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryViewExample();
  }
 
}

class _CategoryViewExample extends State<CategoryViewExample>{
  @override
  Widget build(BuildContext context) {

    List leftList = List();
    for (var i = 0; i < 10; i++) {
      leftList.add(i);
    }

    List rightList = List();
    for (var i = 0; i < 3; i++) {
      rightList.add(i);
    }


    CategoryViewTool categoryView = CategoryViewTool(
        leftViewList: leftList,
        rightViewList: rightList,
        leftViewHeaderBuilder: (BuildContext context){
          return Container(color: Colors.red,height: 90,);
        },
        leftItemBuilder: (BuildContext context,List itemList,int index,bool isSelect){
          if(isSelect){
            return Container(
              height: 60,
            color: Colors.lightBlue,
            child: Center(child: Text("左边"+index.toString()),)
          );
          }else{
            return Container(
              height: 60,
            color: Colors.blue,
            child: Center(child: Text("左边"+index.toString()),)
          );
          }
        },
        leftViewBottomBuilder: (BuildContext context){
          return Container(color: Colors.purple,height: 80,);
        },

        rightViewHeaderBuilder:(BuildContext context){
          return Container(color: Colors.blue,height: 30,);
        },
        rightItemBuilder: (BuildContext context,List itemList,int index){
          if( index%2 ==0){
          return Container(width:double.infinity,height: 150,color: Colors.black12,);
          }
          return Container(width:double.infinity,height: 150,color: Colors.white,);
          
        },
         rightViewBottomBuilder:(BuildContext context){
          return Container(color: Colors.yellow,height: 30,);
        },

        clickLeftHeader: (BuildContext context){
          
          
        },
      );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack().addSubWight(categoryView)
        .addSubWight(FlatButton(child: Text("选择第二个"),color: Colors.blue,onPressed: (){
          categoryView.setSelectIndex(1);
        },),right: 10,bottom: 10).putInfoSaveArea(),
      ),
    );
  }
}