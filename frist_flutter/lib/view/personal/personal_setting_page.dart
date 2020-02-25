import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalInfoSetting extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalInfoSetting();
  }
}

class _PersonalInfoSetting extends State<PersonalInfoSetting>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息设置"),
      ),
    );
  }
}