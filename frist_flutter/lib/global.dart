import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalTool {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
   static  Color mainColor = Colors.red;
    static bool isLogin;

  static Future<GlobalTool> initGloble() async{
GlobalTool globalTool =  GlobalTool();
final SharedPreferences prefs = await _prefs;
    if (prefs.get("userId") == null || prefs.get("userId") == false || prefs.getString("userId").isEmpty){
      isLogin = false;
    }else{
      isLogin = true;
    }
    return null;

     
  }
   
}
