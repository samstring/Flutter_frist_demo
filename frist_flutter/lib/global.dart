import 'dart:developer';

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
String userId = prefs.get("b_Id");
    if ( userId== null|| userId.isEmpty){
      isLogin = false;
    }else{
      isLogin = true;
    }

  initMainColor();
    

    
    return null;

     
  }

  static initMainColor() async{
    final SharedPreferences prefs = await _prefs;
    if(prefs.getString("main_color") == null){
      mainColor = Colors.indigo;
    }else{
      String colorString = prefs.getString("main_color");
      
      if(colorString == "red"){
        mainColor = Colors.red;
      }
      if(colorString == "pink"){
        mainColor = Colors.pink;
      }
      if(colorString == "purple"){
        mainColor = Colors.purple;
      }
      if(colorString == "deepPurple"){
        mainColor = Colors.deepPurple;
      }
      if(colorString == "indigo"){
        mainColor = Colors.indigo;
      }
      if(colorString == "blue"){
        mainColor = Colors.blue;
      }
      if(colorString == "lightBlue"){
        mainColor = Colors.lightBlue;
      }
      if(colorString == "teal"){
        mainColor = Colors.teal;
      }
      if(colorString == "green"){
        mainColor = Colors.green;
      }
       if(colorString == "lightGreen"){
        mainColor = Colors.lightGreen;
      }
      if(colorString == "lime"){
        mainColor = Colors.lime;
      }
      if(colorString == "yellow"){
        mainColor = Colors.yellow;
      }
      if(colorString == "amber"){
        mainColor = Colors.amber;
      }
      if(colorString == "orange"){
        mainColor = Colors.orange;
      }
      if(colorString == "deepOrange"){
        mainColor = Colors.deepOrange;
      }
      if(colorString == "brown"){
        mainColor = Colors.brown;
      }
      if(colorString == "blueGrey"){
        mainColor = Colors.blueGrey;
      }
   

    }
  }

  static setMainColor(MaterialColor color) async{
    if(color == null){
      return;
    }
    final SharedPreferences prefs = await _prefs;
    
   if(color == Colors.red){
     prefs.setString("main_color", "red");
   }
   if(color == Colors.pink){
     prefs.setString("main_color", "pink");
   }
   if(color == Colors.purple){
     prefs.setString("main_color", "purple");
   }
   if(color == Colors.deepPurple){
     prefs.setString("main_color", "deepPurple");
   }
   if(color == Colors.indigo){
     prefs.setString("main_color", "indigo");
   }
   if(color == Colors.blue){
     prefs.setString("main_color", "blue");
   }
   if(color == Colors.lightBlue){
     prefs.setString("main_color", "lightBlue");
   }
   if(color == Colors.cyan){
     prefs.setString("main_color", "cyan");
   }
   if(color == Colors.teal){
     prefs.setString("main_color", "teal");
   }
   if(color == Colors.green){
     prefs.setString("main_color", "green");
   }
   if(color == Colors.lightGreen){
     prefs.setString("main_color", "lightGreen");
   }
   if(color == Colors.lime){
     prefs.setString("main_color", "lime");
   }
   if(color == Colors.yellow){
     prefs.setString("main_color", "yellow");
   }
   if(color == Colors.amber){
     prefs.setString("main_color", "amber");
   }
   if(color == Colors.orange){
     prefs.setString("main_color", "orange");
   }
   if(color == Colors.deepOrange){
     prefs.setString("main_color", "deepOrange");
   }
   if(color == Colors.brown){
     prefs.setString("main_color", "brown");
   }
   if(color == Colors.blueGrey){
     prefs.setString("main_color", "blueGrey");
   }
   mainColor = color;
  }
   
}
