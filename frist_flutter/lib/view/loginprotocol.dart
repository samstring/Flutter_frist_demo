import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class UserProtocol extends StatelessWidget {

 String title;
 String url;

  UserProtocol(String title,String url){
    this.title = title;
    this.url = url;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar:  new AppBar(
        title: Text(this.title),
      ),
      body: Container(
        color: Colors.white,
        // child: new WebviewScaffold(
        //   url: this.url,
        //   // appBar: new AppBar(
        //   //   title: new Text(this.title),
        //   // ),
        // ),
      ),
    );
  }
  
  
}