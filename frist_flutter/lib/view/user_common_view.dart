import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';

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
                child: TextField(
          decoration: InputDecoration(
            labelText: "验证码",
            hintText: "请输入验证码",
              ),
              onChanged: (String str){
                 Provider.of<LoginInfoProvide>(context).setPass(str);
              },
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 0),
              width: 120,
              child:FlatButton(
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.blue,
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