import 'dart:developer';
import 'package:FlutterDemo/contanst.dart';
import 'loginprotocol.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'resetpassword.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'user_common_view.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'dart:convert' as convert;


class CourseloginPage extends StatelessWidget {
  CourseloginPage();

  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: new AppBar(title: new Text("登陆")),
        body: MultiProvider(providers: [
          ChangeNotifierProvider(builder: (_) => LoadingViewProvide()),
          ChangeNotifierProvider(builder: (_) => LoginInfoProvide()),
        ], child: PageContentArea()));
  }
}

//页面区域
class PageContentArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PageContentArea();
  }
}

class _PageContentArea extends State<PageContentArea> {
  @override
  Widget build(BuildContext context) {
    
    // return Flex(direction: Axis.horizontal)
    // .addSubWight(
    //   Stack(alignment:AlignmentDirectional.center).addSubWight(
    //   Container(
    //                   child: ((Provider.of<LoadingViewProvide>(context)
    //                           .isShowLoading)
    //                       ? CircularProgressIndicator()
    //                       : null),
    //                 )
                 
    //   ).addSubWight(InputUserInfo()).addSubWight(AboutText(),bottom: 30)
    // ).putIntoContainer(color: Colors.white).putIntoGeustureDetector(
    //   GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).requestFocus(FocusNode());
    //   })
    // );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.white,
                // color: Color.fromRGBO(233, 134, 233, 1),

                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      child: ((Provider.of<LoadingViewProvide>(context)
                              .isShowLoading)
                          ? CircularProgressIndicator()
                          : null),
                    ),
                    InputUserInfo(),
                    Positioned(
                      bottom: 30,
                      child: AboutText(),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

//登陆信息输入区域
class InputUserInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InputUserInfo();
  }
}

class _InputUserInfo extends State<InputUserInfo> {
  int isShowLoading = 0;
  int loginMode = 0; //登陆模式 1 手机短信登陆 2登陆密码登陆
  InputUserText inputUserText;


  @override
  Widget build(BuildContext context) {
     return Column()
    .addSubWight(Image(
          image: AssetImage("assets/images/shangcheng.png"),
          width: 100.0,
          height: 100.0,
        ))
    .addSubWight(InputUserText(loginMode))
    .addSubWight(
      FlatButton(
                // minWidth: double.infinity,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "登陆",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  clickLoginButton(context,this.inputUserText);
                },
              ).putIntoContainer(padding:EdgeInsets.only(left: 20, right: 20, top: 10),height: 60,width: double.infinity ))
      .addSubWight(
      Stack().addSubWight(FlatButton(
                    child: Text("忘记密码"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ResetPassword();
                      }));
                    }),left: 10)
                .addSubWight(FlatButton(
                    child: loginMode == 0 ? Text("账号密码登陆") : Text("手机号登陆"),
                    onPressed: () {
                      if (loginMode == 0) {
                        loginMode = 1;
                      } else {
                        loginMode = 0;
                      }
                      setState(() {});
                    },
                  ),right: 10).putIntoContainer(height: 50)
      );

    // inputUserText = InputUserText(loginMode);
    // Column inputArea = Column(
    //   children: <Widget>[
    //     // Text("输入框"),
    //     Image(
    //       image: AssetImage("assets/images/shangcheng.png"),
    //       width: 100.0,
    //       height: 100.0,
    //     ),
    //     inputUserText,
    

    //     FlatButton(
    //             // minWidth: double.infinity,
    //             color: Colors.blue,
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10)),
    //             child: Text(
    //               "登陆",
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),
    //             ),
    //             onPressed: () {
    //               clickLoginButton(context,this.inputUserText);
    //             },
    //           ).putIntoContainer(padding:EdgeInsets.only(left: 20, right: 20, top: 10),height: 60,width: double.infinity ),
    //     Stack().addSubWight(FlatButton(
    //                 child: Text("忘记密码"),
    //                 onPressed: () {
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: (context) {
    //                     return ResetPassword();
    //                   }));
    //                 }),left: 10)
    //             .addSubWight(FlatButton(
    //                 child: loginMode == 0 ? Text("账号密码登陆") : Text("手机号登陆"),
    //                 onPressed: () {
    //                   if (loginMode == 0) {
    //                     loginMode = 1;
    //                   } else {
    //                     loginMode = 0;
    //                   }
    //                   setState(() {});
    //                 },
    //               ),right: 10).putIntoContainer(height: 50),
    //   ],
    // );

   
  }


  void clickLoginButton(BuildContext context,InputUserText inputUserText){
    FocusScope.of(context).requestFocus(FocusNode());
                  ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
                      
                      UserModel user = Provider.of<LoginInfoProvide>(context).user;
                      log( (user.phone == null).toString());
                      String phone = user.phone;
                      String password = user.password;

                  // log((password).toString());

                  if (phone == null || phone.isEmpty) {
                    _state.showSnackBar(SnackBar(
                      content: Text("手机号不能为空"),
                    ));
                    return;
                  }
                  if (password == null || password.isEmpty) {
                    if (inputUserText._loginMode == 0) {
                      _state.showSnackBar(SnackBar(
                        content: Text("验证码不能为空"),
                      ));
                      return;
                    } else {
                      _state.showSnackBar(SnackBar(
                        content: Text("密码不能为空"),
                      ));
                      return;
                    }
                  }

                  Provider.of<LoadingViewProvide>(context)
                      .setLoadingState(true);

                  NetWorkTool netTool = NetWorkTool();
                  netTool.netWorkCallback =
                      (Response response, Exception exception) {
                    // log(response.toString());
                    if (exception == null) {
                      String responeString = response.toString();
                      Map map = convert.jsonDecode(responeString);

                      UserModel userModel = UserModel.fromJson(map["result"]);

                      log(userModel.phone);
                    } else {
                      //调用ScaffoldState的showSnackBar来弹出SnackBar
                      _state.showSnackBar(
                        SnackBar(
                          content: Text(exception.toString()),
                        ),
                      );
                    }

                    Provider.of<LoadingViewProvide>(context)
                        .setLoadingState(false);
                  };

                  netTool.post(
                      login_url,
                      {
                        "user.phoneNumber": phone,
                        "user.password": password,
                        "loginModel": "1"
                      });
                  log("点击登陆按钮");
  }
}

//输入框区域
class InputUserText extends StatelessWidget {
  int _loginMode;

  InputUserText(int loginMode) {
    _loginMode = loginMode;
  }

  @override
  Widget build(BuildContext context) {
    return Column()
    .addSubWight(TextField(
            decoration: InputDecoration(
              labelText: (_loginMode == 0 ? "手机号" : "账号"),
              hintText: (_loginMode == 0 ? "请输入手机号" : "请输入账号"),
            ),
            onChanged: (String str) {
              Provider.of<LoginInfoProvide>(context).setPhoneNumber(str);
            },
          ))
    .addSubWight(
     Container(
            child: _loginMode == 0
                ? CountDownArea()
                : TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "请输入密码",
                    ),
                    onChanged: (String str) {
                      Provider.of<LoginInfoProvide>(context).setPass(str);
                    }),
          )
    ).putIntoContainer( padding: EdgeInsets.only(left: 20, right: 20));
    // TODO: implement build
    // return Padding(
    //   padding: EdgeInsets.only(left: 20, right: 20),
    //   child: Column(
    //     children: <Widget>[
    //       TextField(
    //         decoration: InputDecoration(
    //           labelText: (_loginMode == 0 ? "手机号" : "账号"),
    //           hintText: (_loginMode == 0 ? "请输入手机号" : "请输入账号"),
    //         ),
    //         onChanged: (String str) {
    //           Provider.of<LoginInfoProvide>(context).setPhoneNumber(str);
    //         },
    //       ),
    //       Container(
    //         child: _loginMode == 0
    //             ? CountDownArea()
    //             : TextField(
    //                 obscureText: true,
    //                 decoration: InputDecoration(
    //                   labelText: "密码",
    //                   hintText: "请输入密码",
    //                 ),
    //                 onChanged: (String str) {
    //                   Provider.of<LoginInfoProvide>(context).setPass(str);
    //                 }),
    //       ),
    //     ],
    //   ),
    // );
  }
}

//底部协议区域
class AboutText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 富文本
    return Row().addSubWight(Text("新用户点击登陆即代表已同意")).addSubWight(
       GestureDetector(
          onTap: () {
            log("点击文本");
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UserProtocol("协议", "https://www.baidu.com");
            }));
          },
          child: Text.rich(TextSpan(
              text: "《flutter demo》协议",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))),
        )
    );
  
  }
}

