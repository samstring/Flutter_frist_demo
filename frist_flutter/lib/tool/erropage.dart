import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  String errorText;
  ErrorPage(this.errorText);

  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(title: new Text("错误提示")),
        body: Center(
          child: Text(errorText != null ? "页面丢失了!":errorText),
        ));
  }
}