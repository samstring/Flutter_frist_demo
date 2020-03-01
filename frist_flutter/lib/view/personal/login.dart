import 'dart:developer';
import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/tool/loading_view.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FlutterDemo/model/user_common_provider.dart';
import 'package:FlutterDemo/view/user_common_view.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'dart:convert' as convert;

import '../loginprotocol.dart';
import '../resetpassword.dart';

class CourseloginPage extends StatelessWidget {
  CourseloginPage();

  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
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
    return _PageContentArea();
  }
}

class _PageContentArea extends State<PageContentArea> {
  InputUserInfo inputUserInfo;
  AboutText aboutText;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputUserInfo = InputUserInfo();
    aboutText = AboutText();
  }

  @override
  Widget build(BuildContext context) {
    Stack content = Stack()
        // .addSubWight(Container(
        //   child: ((Provider.of<LoadingViewProvide>(context).isShowLoading)
        //       ? CircularProgressIndicator()
        //       : null),
        // ))
        .addSubWight(
            Image(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/user_background3.jpg"),
            ),
            bottom: 80,
            top: 0,
            left: 0,
            right: 0)
        .addSubWight(inputUserInfo, bottom: 80, top: 0, left: 0, right: 0)
        .addSubWight(aboutText, bottom: 0, left: 0, right: 0);

    return content
        // .putInfoSaveArea(top: false)
        .putIntoGestureDetector(GestureDetector(onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    }));
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
    inputUserText = InputUserText(loginMode);
    return Column()
        .addSubWight(Column()
            .addSubWight(Image(
              image: AssetImage("assets/images/ITquanxian.png"),
              width: 60.0,
              height: 60.0,
            ))
            .addSubWight(Text(
              "尚科科技",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ))
            .addSubWight(Text(
              "真诚为你服务",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ))
            .putIntoContainer(margin: EdgeInsets.only(top: 90, bottom: 70)))
        .addSubWight(inputUserText)
        .addSubWight(FlatButton(
          color: Color.fromRGBO(107, 179, 55, 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "登陆",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            clickLoginButton(context, inputUserText);
          },
        ).putIntoContainer(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.only(left: 40, right: 40),
            height: 45,
            width: double.infinity))
        .addSubWight(Stack()
            .addSubWight(
                FlatButton(
                    child: Text(
                      "忘记密码",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ResetPassword();
                      }));
                    }),
                left: 40)
            .addSubWight(
                FlatButton(
                  child: loginMode == 0
                      ? Text("账号密码登陆", style: TextStyle(color: Colors.white))
                      : Text("手机号登陆", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    if (loginMode == 0) {
                      loginMode = 1;
                    } else {
                      loginMode = 0;
                    }
                    setState(() {});
                  },
                ),
                right: 40)
            .putIntoContainer(height: 50))
        .putIntoContainer(color: Colors.transparent);
  }

  void clickLoginButton(BuildContext context, InputUserText inputUserText) {
    
    showDialog(
      context: context,
      builder: (context){
        return LoadingDialog();
      }
    );

    FocusScope.of(context).requestFocus(FocusNode());
    ScaffoldState _state =
        context.ancestorStateOfType(TypeMatcher<ScaffoldState>());

    UserModel user = Provider.of<LoginInfoProvide>(context).user;
    String phone = user.phoneNumber;
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

    Provider.of<LoadingViewProvide>(context).setLoadingState(true);

    NetWorkTool netTool = NetWorkTool();
    netTool.netWorkCallback = (Response response, Exception exception) {
      Navigator.pop(context);
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      // log(response.toString());
      if (map != null) {
        if (map['resultCode'] == "200") {
          UserModel userModel = UserModel.fromJson(map["result"]);
          UserTool.setUserInfo(context, userModel).then((onValue) {
            Provider.of<LoadingViewProvide>(context).setLoadingState(false);
          });
        } else {
          _state.showSnackBar(
            SnackBar(
              content: Text(map['error'].toString()),
            ),
          );
        }
      } else {
        //调用ScaffoldState的showSnackBar来弹出SnackBar
        _state.showSnackBar(
          SnackBar(
            content: Text(exception.toString()),
          ),
        );

        Provider.of<LoadingViewProvide>(context).setLoadingState(false);
      }
    };

    netTool.post(login_url, {
      "user.phoneNumber": phone,
      "user.password": password,
      "loginModel": "1"
    });
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
        .addSubWight(CupertinoTextField(
          padding: EdgeInsets.only(left: 20, right: 20),
          style: TextStyle(color: Colors.white),
          placeholder: (_loginMode == 0 ? "手机号" : "账号"),
          placeholderStyle: TextStyle(color: Colors.white),
          decoration: BoxDecoration(),
          onChanged: (String str) {
            Provider.of<LoginInfoProvide>(context).setPhoneNumber(str);
          },
        ).putIntoContainer(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(30)),
            height: 40))
        .addSubWight(Container(
          margin: EdgeInsets.only(top: 20),
          child: _loginMode == 0
              ? CountDownArea().putIntoContainer(height: 40)
              : CupertinoTextField(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      style: TextStyle(color: Colors.white),
                      placeholder: (_loginMode == 0 ? "验证码" : "密码"),
                      placeholderStyle: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: BoxDecoration(),
                      onChanged: (String str) {
                        Provider.of<LoginInfoProvide>(context).setPass(str);
                      })
                  .putIntoContainer(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(30)),
                      height: 40),
        ))
        .putIntoContainer(padding: EdgeInsets.only(left: 40, right: 40));
  }
}

//底部协议区域
class AboutText extends StatelessWidget {
  TapGestureRecognizer tapGestureRecognizer = new TapGestureRecognizer();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text.rich(TextSpan(
      children: <TextSpan>[
        TextSpan(text: "新用户点击登陆即代表已同意"),
        TextSpan(
            text: "《flutter demo》协议",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
            recognizer: tapGestureRecognizer
              ..onTap = () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserProtocol("协议", "https://www.baidu.com");
                }));
              }),
      ],
    )).putIntoContainer(
        color: Colors.white,
        width: double.infinity,
        height: 80,
        alignment: Alignment.center);
  }
}
