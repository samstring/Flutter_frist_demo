import 'dart:developer';
import 'dart:io';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:FlutterDemo/tool/loading_view.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:FlutterDemo/view/personal/crop_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'dart:convert' as convert;

class PersonalInfoSetting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalInfoSetting();
  }
}

class _PersonalInfoSetting extends State<PersonalInfoSetting> {
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    Widget imageWidght = Image(
      image: (userModel == null || userModel.avatarImage == null)
          ? AssetImage("assets/images/ITquanxian.png")
          : NetworkImage(userModel.avatarImage),
      width: 40,
      height: 40,
    );
    UserTool.getUserInfo().then((userModel) {
      if (userModel != null && userModel.avatarImage != null) {
        setState(() {
          this.userModel = userModel;
        });
      }
    });

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("个人信息设置"),
        ),
        body: Card(
            child: ListView(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Stack()
                .addSubWight(Text("头像"), top: 24, left: 15)
                .addSubWight(
                     ClipOval(child: imageWidght,).putIntoContainer(width: 50,height: 50),
                    top: 10,
                    right: 24)
                .addSubWight(
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    right: 0,
                    top: 25)
                .putIntoContainer(height: 90, color: Colors.white)
                .putIntoGestureDetector(
                    GestureDetector(onTapDown: (event) async {
              ImagePicker.pickImage(source: ImageSource.gallery)
                  .then((imageFile) {
                if (imageFile != null) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CropImageRoute(imageFile)));
                }
              });
            })),
            PersonalInfoSettingItem(
              title: "用户名",
              subTitle: (userModel == null || userModel.name == null)
                  ? ""
                  : userModel.name,
              isShowRightArrow: true,
            ).putIntoGestureDetector(GestureDetector(
              onTapDown: (event) {
                showDialog(
                    context: context,
                    builder: (contenxt) {
                      return ChangeUserInfoDialog("用户名", userModel.name,
                          (content) {
                        NetWorkTool netWorkTool = NetWorkTool();
                        netWorkTool.netWorkCallback = (response, error) {
                          ScaffoldState _state = context.ancestorStateOfType(
                              TypeMatcher<ScaffoldState>());

                          String responeString = response.toString();
                          Map map = convert.jsonDecode(responeString);
                          if (map != null) {
                            if (map['resultCode'] == "200") {
                              UserModel userModel =
                                  UserModel.fromJson(map["result"]);
                              UserTool.setUserInfo(context, userModel)
                                  .then((onValue) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            }
                          } else {
                            Navigator.pop(context);
                            _state.showSnackBar(
                              SnackBar(
                                content: Text(map['error'].toString()),
                              ),
                            );
                          }
                        };

                        netWorkTool.post(updateUserInfo_url, {
                          "user.b_Id": userModel.bId,
                          "user.bbToken.b_tokenString":
                              userModel.bbToken.bTokenString,
                          "propertyKey": "name",
                          "propertyValue": content,
                        });
                      });
                    });
              },
            )),
            PersonalInfoSettingItem(
              title: "个性签名",
              subTitle: (userModel == null || userModel.userDesc == null)
                  ? ""
                  : userModel.userDesc,
              isShowRightArrow: true,
            ).putIntoGestureDetector(GestureDetector(
              onTapDown: (event) {
                showDialog(
                    context: context,
                    builder: (contenxt) {
                      return ChangeUserInfoDialog("个性签名", userModel.userDesc,
                          (content) {
                        NetWorkTool netWorkTool = NetWorkTool();
                        netWorkTool.netWorkCallback = (response, error) {
                          ScaffoldState _state = context.ancestorStateOfType(
                              TypeMatcher<ScaffoldState>());

                          String responeString = response.toString();
                          Map map = convert.jsonDecode(responeString);
                          if (map != null) {
                            if (map['resultCode'] == "200") {
                              UserModel userModel =
                                  UserModel.fromJson(map["result"]);
                              UserTool.setUserInfo(context, userModel)
                                  .then((onValue) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            }
                          } else {
                            Navigator.pop(context);
                            _state.showSnackBar(
                              SnackBar(
                                content: Text(map['error'].toString()),
                              ),
                            );
                          }
                        };

                        netWorkTool.post(updateUserInfo_url, {
                          "user.b_Id": userModel.bId,
                          "user.bbToken.b_tokenString":
                              userModel.bbToken.bTokenString,
                          "propertyKey": "userDesc",
                          "propertyValue": content,
                        });
                      });
                    });
              },
            ))
          ],
        )).putIntoContainer(
          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        ));
  }
}

class PersonalInfoSettingItem extends StatelessWidget {
  final String title;
  String subTitle;
  bool isShowRightArrow;

  PersonalInfoSettingItem(
      {Key key, this.title, this.subTitle, this.isShowRightArrow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stack content = Stack().addSubWight(
        Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
        top: 27,
        left: 15);
    if (this.subTitle != null) {
      content = content.addSubWight(
          Text(
            this.subTitle,
            textAlign: TextAlign.end,
          ).putIntoContainer(width: 150),
          right: 30,
          top: 28);
    }
    if (this.isShowRightArrow != null && this.isShowRightArrow == true) {
      content = content.addSubWight(
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
          right: 10,
          top: 31);
    }

    // TODO: implement build
    return Column()
        .addSubWight(Container(
          height: 1,
          color: Colors.black12,
          margin: EdgeInsets.only(left: 15, right: 15),
        ))
        .addSubWight(
          content.putIntoContainer(
            height: 70,
          ),
        ).putIntoContainer(color:Colors.white);
  }
}

typedef ChangeUserInfoBlock = Function(String content);

class ChangeUserInfoDialog extends StatefulWidget {
  final String title;
  final String content;
  final ChangeUserInfoBlock changeUserInfoBlock;

ChangeUserInfoDialog(this.title, this.content, this.changeUserInfoBlock);

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangeUserInfoDialog(this.title,this.content,this.changeUserInfoBlock);
  }
}

class _ChangeUserInfoDialog extends State<ChangeUserInfoDialog> {
  final String title;
  final String content;
  final ChangeUserInfoBlock changeUserInfoBlock;
  String inputContent;

  TextEditingController textEditingController;

  _ChangeUserInfoDialog(this.title, this.content, this.changeUserInfoBlock);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     textEditingController = TextEditingController();
    textEditingController.addListener((){
      setState(() {
        this.inputContent = textEditingController.value.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   

    Stack content = Stack()
        .addSubWight(
            Center(
              child: Text(this.title),
            ).putIntoContainer(height: 40),
            top: 0,
            right: 0,
            left: 0)
        .addSubWight(
            Center(
              child: CupertinoTextField(
                placeholder: this.content,
                controller: textEditingController,
              ),
            ).putIntoContainer(height: 70),
            top: 80,
            right: 10,
            left: 10)
        .addSubWight(
            Flex(
              direction: Axis.horizontal,
            )
                .addSubWight(
                    FlatButton(
                      child: Text("取消"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.white,
                    ),
                    flex: 1)
                .addSubWight(
                    FlatButton(
                      child: Text(
                        "确定",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                    
                        if(inputContent == null || inputContent.isEmpty){
                          
                            return;
                        }
                        else{
                          if (this.changeUserInfoBlock != null) {
                          this.changeUserInfoBlock(
                              textEditingController.value.text);
                        }
                        }
                      },
                      color: (inputContent == null || inputContent.isEmpty) ? Colors.black12:Colors.blueAccent,
                    ),
                    flex: 1)
                .putIntoContainer(height: 40),
            bottom: 0,
            right: 0,
            left: 0);

    //创建透明层
    return new Material(
      type: MaterialType.transparency,
      child: new Container(
        child: new Center(
            child: new Container(
          width: 300,
          height: 300,
          color: Colors.white,
          child: content,
        )),
      ),
    );
  }
}
