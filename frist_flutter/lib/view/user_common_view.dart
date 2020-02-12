import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'package:sfviewtool/sfviewtool.dart';

class CountDownArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          child:Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CupertinoTextField(
                   padding: EdgeInsets.only(left: 20, right: 20),
                      style: TextStyle(color: Colors.white),
                      placeholder: "请输入验证码",
                      placeholderStyle: TextStyle(color: Colors.white),
                
          decoration: BoxDecoration(
            // labelText: "验证码",
            // hintText: "请输入验证码",
              ),
              onChanged: (String str){
                 Provider.of<LoginInfoProvide>(context).setPass(str);
              },
              ).putIntoContainer(decoration: BoxDecoration(border:Border.all(color: Colors.white,width: 1),borderRadius: BorderRadius.circular(30)),height: 40),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 0,left: 10),
              width: 120,
              child:FlatButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                color: Color.fromRGBO(107, 179, 55, 1),
                child: Text("获取验证码",style: TextStyle(color: Colors.white),),
                 onPressed: () {
                   ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
                    _state.showSnackBar(
                        SnackBar(
                          content: Text("验证码是1111"),
                        ),
                      );
                 },
                
              ) ,
            )
              
            ],
          )
        );
  }
  
}