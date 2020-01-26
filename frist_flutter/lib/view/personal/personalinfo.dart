import 'dart:developer';
import 'dart:ui';

import 'package:FlutterDemo/contanst.dart';
// import 'package:FlutterDemo/tool/viewlayouttool.dart';
// import 'package:FlutterDemo/tool/viewgusturetool.dart';
// import 'package:FlutterDemo/tool/viewcontainertool.dart';
import 'package:FlutterDemo/tool/sfviewtool/lib/sfviewtool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '';

class PersonalInfoPage extends StatelessWidget {
   List<String> settingTitles = ["个人主页","设置","收藏","退出登陆"];
  @override
  Widget build(BuildContext context) {
 
    // content.putIntoGeustureDetector(listener);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          PersonalInfo(),
          ItemView(settingTitles[0], isShowBottomLine:true,isShowLeftIcon: true,leftIcon: Icon(Icons.person,size: 25,)),
          ItemView(settingTitles[1], isShowBottomLine:true,isShowLeftIcon: true,leftIcon: Icon(Icons.settings,size: 25,)),
          ItemView(settingTitles[2], isShowBottomLine:true,isShowLeftIcon: true,leftIcon: Icon(Icons.favorite,size: 25,)),
           ItemView(settingTitles[3], isShowBottomLine:true,isShowLeftIcon: true,isShowRigIcon: false,leftIcon: Icon(Icons.exit_to_app,size: 25,),).putIntoGeustureDetector(GestureDetector(
      onTapDown: ( event){  
        showDeleteConfirmDialog1(context);
      })),
        ],
      ),
    );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("退出登陆?"),
        content: Text("退出登陆后无法收到课程更新喔"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(), // 关闭对话框
          ),
          FlatButton(
            child: Text("退出",style: TextStyle(color: Colors.red),),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );
}
}

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image(
          image: AssetImage("assets/images/shangcheng.png"),
          width: 100.0,
          height: 100.0,
        ).putIntoContainer(width: 100,height: 100,alignment: Alignment.center).putIntoContainer(width: double.infinity,height: 300,color: Colors.black12);
  }
}

class ItemView extends StatelessWidget {
  String _title;
  bool _isShowBottomLine;
  bool _isShowLeftIcon1;
  bool _isShowRigIcon;
  Icon _leftIcon;
  Icon _rightIcon;

  ItemView(String title, {bool isShowBottomLine,bool isShowLeftIcon,bool isShowRigIcon,Icon leftIcon,Icon rightIcon}) {
    _title = title;
    _isShowBottomLine = isShowBottomLine != null ? isShowBottomLine:true ;
    _isShowLeftIcon1 = isShowLeftIcon != null ? isShowLeftIcon:true ;
    _isShowRigIcon = isShowRigIcon != null ? isShowRigIcon:true ;
    _leftIcon = leftIcon;
    _rightIcon = rightIcon;
  }

  @override
  Widget build(BuildContext context) {
    Widget line = Container(
      width: double.infinity,
      height: 1,
      color: Colors.black26,
    );
    Stack stack = Stack().addSubWight(Text(_title), left: 40,top: 10);

   if(_isShowLeftIcon1 !=null && _isShowLeftIcon1 && _leftIcon != null){
    stack =  stack.addSubWight(_leftIcon,left: 10,top: 10);
    }
    if(_isShowRigIcon !=null && _isShowRigIcon){
      if(_rightIcon != null){
        stack =  stack.addSubWight(_rightIcon,right: 10,top: 10);
      }else{
        stack =  stack.addSubWight(Icon(Icons.arrow_right,size: 20,),right: 10,top: 10);
      }
     
    }


    Widget content =  stack.putIntoContainer(width: double.infinity, height: 40,color: Colors.white);    
 
    if(!_isShowBottomLine){
      return content;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    ).addSubWight(content).addSubWight(line);
  }
  
}
