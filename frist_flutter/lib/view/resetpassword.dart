import 'package:flutter/material.dart';
// import 'Fl/model/user_common_provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'user_common_view.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title:Text("重置密码"),
      ),
      body:InputUserTextArea(),
    );
  }
  
}

class InputUserTextArea extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: "手机号",
            hintText:  "请输入手机号",
          ),
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: "新密码",
            hintText: "请输入新的密码",
          )
          
        ),
        CountDownArea(),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          color: Colors.blue,
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text("重置密码",style: TextStyle(color: Colors.white)),
            onPressed: (){

            },
          ),
        )
      ],
    ),
    );
  }
  
}

