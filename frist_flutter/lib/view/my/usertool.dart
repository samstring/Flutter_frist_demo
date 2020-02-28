import 'dart:developer';

import 'package:FlutterDemo/global.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTool{
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  static Future<bool> isLogin () async{
    final SharedPreferences prefs = await _prefs;
    prefs.get("userId"+prefs.get("userId"));
    if (prefs.get("userId") == null || prefs.get("userId") == false || prefs.getString("userId").isEmpty){
      return false;
    }
    return true;
  }

  static Future setUserInfo(BuildContext context,UserModel model) async{
    final SharedPreferences prefs = await _prefs;
  
    if(model != null){
      if(model.b_Id != null && model.b_Id.isNotEmpty){
        prefs.setString("b_Id", model.b_Id);
        prefs.setString("phoneNumber", model.phoneNumber);
        prefs.setString("userName", model.userName);
        prefs.setString("userDesc", model.userDesc);
        prefs.setString("avatarImage", model.avatarImage);
        prefs.setString("b_tokenString", model.bbToken.b_tokenString);
        prefs.setString("chat_tokenString", model.bbToken.chat_tokenString);

        log(model.b_Id.toString());
        GlobalTool.isLogin = true;
           
      }
    }else{
      //清除用户信息
      // prefs.setString("b_Id", "");
      GlobalTool.isLogin = false;
        
    }

    Provider.of<UserInfoProvider>(context).setUserInfo(model);
  }

  static Future<UserModel> getUserInfo() async{
    final SharedPreferences prefs = await _prefs;
    UserToken token = UserToken(b_tokenString: prefs.get("b_tokenString"),chat_tokenString:prefs.get("chat_tokenString") );
    UserModel model = UserModel(b_Id: prefs.get("b_tokenString"),phoneNumber:prefs.get("phoneNumber"),userName: prefs.get("userName"),userDesc:prefs.get("userDesc"),avatarImageUrl:prefs.get("avatarImage"),bbToken: token);
    return model;
  }
}