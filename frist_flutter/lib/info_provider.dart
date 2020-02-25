import 'package:FlutterDemo/global.dart';
import 'package:flutter/material.dart';

class AppInfoProvide with ChangeNotifier {
  
  Color _primarySwatchColor = Colors.green;

  getAppPrimarySwatch(){
    if(GlobalTool.mainColor == null){
      _primarySwatchColor = Colors.green;
    }else{
      _primarySwatchColor = GlobalTool.mainColor;
    }
    return _primarySwatchColor;
  }
  setAppPrimarySwatch(Color color){
    
    _primarySwatchColor = color;
    GlobalTool.setMainColor(color);
    // log("1111");
    notifyListeners();
  }
}