import 'dart:developer';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

import '../../global.dart';

class UserInfoItem extends StatelessWidget {

  UserModel _userModel;

  UserInfoItem(UserModel userModel){
    _userModel = userModel;
  }

  @override
  Widget build(BuildContext context) {
    log(_userModel.avatarImage);
    if (_userModel == null) {
      return Container(width: double.infinity,height: 60,);
    }
    // TODO: implement build
    return Row().addSubWight(
      
      Image.network(
        _userModel.avatarImage == null ? "":_userModel.avatarImage 
        ,width: 48,height: 48,
      )
      .putIntoContainer(margin: EdgeInsets.only(left: 0,top: 5,bottom: 5,right:5),color: GlobalTool.mainColor,width: 48,height: 48)
    )
    .addSubWight(
      Column().
      addSubWight(Text(_userModel.name == null ? "" :_userModel.name,style: TextStyle(fontSize: 17),textAlign: TextAlign.left).putIntoContainer(width: 200))
      .addSubWight(Text(_userModel.userDesc == null ? "" :_userModel.userDesc,textAlign: TextAlign.left).putIntoContainer(width: 200))
      .putIntoContainer(margin: EdgeInsets.only(top: 5))
    ).putIntoContainer(height: 60,width: double.infinity);
  }
  
}