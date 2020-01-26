import 'package:flutter/material.dart';

class MainPage extends StatelessWidget{


MainPage();

Widget build(BuildContext context){
return new Scaffold(
  resizeToAvoidBottomPadding: false,
  appBar: new AppBar(
  title: new Text("首页"),
  // 
  ),

  body:Text("首页")
  );
}
}