import 'dart:developer';

import 'package:FlutterDemo/view/search_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:sfviewtool/sfviewtool.dart';

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
      onTap: (){
       
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return TextField(
      onTap: (){
         FocusScope.of(context).requestFocus(FocusNode());
        
        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
          return SearchPage();
        }));
      },
      onSubmitted: (text) {
        
      },
      onChanged: (text) {
       
      },
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          isDense: false,
          filled: true,
          fillColor: Color.fromRGBO(235, 235, 235, 1),
          contentPadding: EdgeInsets.only(left: 10),
          border: InputBorder.none,
          // icon:Icon(Icons.search),
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Colors.black12
          ),
          hintText:"搜索",
          // labelText: searchText == null || searchText.isEmpty ? null:searchText,
          alignLabelWithHint: true,
          hintStyle: new TextStyle(fontSize: 14, color: Colors.black45)),
    ).putIntoContainer(
        decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(235, 235, 235, 1), width: 1.0), //灰色的一层边框
          color: Color.fromRGBO(235, 235, 235, 1),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        margin: EdgeInsets.only(left: 5),
        height: 36);
  }
}