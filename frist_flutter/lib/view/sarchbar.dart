import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:ui';

//搜索控件widget
///搜索控件widget
class TextFileWidget extends StatelessWidget {
  Widget buildTextField(BuildContext context) {
    //theme设置局部主题
    return  TextField(
      cursorColor: Colors.white, //设置光标
      decoration: InputDecoration(
          //输入框decoration属性
          // contentPadding: new EdgeInsets.only(top: 3),
          border: InputBorder.none,
          icon:Icon(Icons.search),
          hintText: "请输入关键字",
          hintStyle: new TextStyle(fontSize: 14, color: Colors.black38)),
      style: new TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        //修饰黑色背景与圆角
        decoration:  BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1.0), //灰色的一层边框
          color: Colors.black12,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        alignment: Alignment.center,
        height: 44,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField( context),
      );
    }

    var cancleView = new Text("cancel");

    return
     editView();
  }
}