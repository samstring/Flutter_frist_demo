import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

class TestLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Widget one1 = Container(color: Colors.red,width: 30,height: 30,);
    Widget one2 = Container(color: Colors.blue,width: 30,height: 30,);
    Widget one3 = Container(color: Colors.green,width: 30,height: 30,);
    // TODO: implement build
    // Stack().addSubWight(one1,top: 0,left: 0,width: 100,height: 100);
    
    return Scaffold(
      body: Stack().addSubWight(one1,top: 0,left: 0,width: 100,height: 200).putIntoContainer(width: double.infinity,height: double.infinity)
    );
  }
}