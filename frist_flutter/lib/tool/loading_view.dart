
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends Dialog {
 
  @override
  Widget build(BuildContext context) {

    //创建透明层
    return new Material( 
      type: MaterialType.transparency,
      child: new Container(
        width: 150,
        height: 150,
        child:new Center(
            child:new Container(
              width: 150,
              height: 150,
              color: Colors.black38,
              child:SpinKitCircle(
              color: Colors.white,
              size: 50,
              )
            )
        ),
      ),
    );
  }
}

