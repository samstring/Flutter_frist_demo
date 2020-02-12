import 'package:flutter/material.dart';

class AppInfoProvide with ChangeNotifier {
  Color primarySwatchColor = Colors.green;
  setAppPrimarySwatch(Color color){
    primarySwatchColor = color;
    // log("1111");
    notifyListeners();
  }
}