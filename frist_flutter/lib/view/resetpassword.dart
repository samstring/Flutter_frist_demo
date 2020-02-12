import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'Fl/model/user_common_provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'user_common_view.dart';
import 'package:provider/provider.dart';
import 'package:sfviewtool/sfviewtool.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar:AppBar(
      // title:Text("重置密码"),
      // backgroundColor: Colors.transparwhient,
      // ),
      body: InputUserTextArea(),
    );
  }
}

class InputUserTextArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget content = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: <Widget>[
          CupertinoTextField(
            padding: EdgeInsets.only(left: 20, right: 20),
            style: TextStyle(color: Colors.white),
            placeholder: "手机号",
            decoration: BoxDecoration(),
            placeholderStyle: TextStyle(color: Colors.white),
          ).putIntoContainer(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              height: 40,margin: EdgeInsets.only(top: 15)),
          CupertinoTextField(
            padding: EdgeInsets.only(left: 20, right: 20),
            style: TextStyle(color: Colors.white),
            placeholder: "密码",
            placeholderStyle: TextStyle(color: Colors.white),
            decoration: BoxDecoration(),
            obscureText: true,
          ).putIntoContainer(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(30)),
              height: 40,margin: EdgeInsets.only(top: 15)),
          CountDownArea().putIntoContainer(margin: EdgeInsets.only(top: 15)),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            // color: Colors.blue,
            child: FlatButton(
              color: Color.fromRGBO(107, 179, 55, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: Text("重置密码",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {},
            ),
          )
        ],
      ),
    ).putIntoContainer(
      padding: EdgeInsets.only(left: 0, right: 0, top: 50, bottom: 50),
      // color: Colors.white,

      // decoration: BoxDecoration(border: Border.all(color: Colors.white, width: 1),borderRadius:  BorderRadius.circular(30),color: Colors.white)
    );

    return Stack()
        .addSubWight(
            Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/login_background3.jpg"),
            ),
            bottom: 0,
            top: 0,
            left: 0,
            right: 0)
        .addSubWight(content, top: 150, left: 50, right: 50);
    // ;
  }
}
