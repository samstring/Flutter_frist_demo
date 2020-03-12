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
      if(model.bId != null && model.bId.isNotEmpty){
        prefs.setString("b_Id", model.bId);
        prefs.setString("phoneNumber", model.phoneNumber);
        prefs.setString("userName", model.name);
        prefs.setString("userDesc", model.userDesc);
        prefs.setString("avatarImage", model.avatarImage);
        prefs.setString("b_tokenString", model.bbToken.bTokenString);
        prefs.setString("chat_tokenString", model.bbToken.chatTokenString);

        log(model.bId.toString());
        GlobalTool.isLogin = true;
           
      }
    }else{
      //清除用户信息
      // prefs.setString("b_Id", "");
      GlobalTool.isLogin = false;
         prefs.setString("b_Id", null);
        prefs.setString("phoneNumber",null);
        prefs.setString("userName", null);
        prefs.setString("userDesc", null);
        prefs.setString("avatarImage", null);
        prefs.setString("b_tokenString", null);
        prefs.setString("chat_tokenString", null);
    }

    Provider.of<UserInfoProvider>(context).setUserInfo(model);
  }

  static Future<UserModel> getUserInfo() async{
    final SharedPreferences prefs = await _prefs;
    BbToken token = BbToken(bTokenString: prefs.get("b_tokenString"),chatTokenString:prefs.get("chat_tokenString") );
    UserModel model = UserModel(bId: prefs.get("b_Id"),phoneNumber:prefs.get("phoneNumber"),name: prefs.get("userName"),userDesc:prefs.get("userDesc"),avatarImage:prefs.get("avatarImage"),bbToken: token);
    return model;
  }
}