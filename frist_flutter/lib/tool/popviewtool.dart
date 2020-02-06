import 'package:flutter/material.dart';

class PopViewTool{
  static showWidget(BuildContext context,Widget widget){
Navigator.push(
  context,
  PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return new FadeTransition(
        //使用渐隐渐入过渡,
        opacity: animation,
        child: ShowView(widget: widget,), //路由B
      );
    },
  ),
);
  }
}

class ShowView extends StatelessWidget{
  final Widget widget;

  const ShowView({Key key, this.widget}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widget,
    );
  }
}