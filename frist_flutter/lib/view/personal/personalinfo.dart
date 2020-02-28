import 'dart:ui';

import 'package:FlutterDemo/model/user_common_provider.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:provider/provider.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import '';

class PersonalInfoPage extends StatelessWidget {
  List<String> settingTitles = ["个人主页", "设置", "收藏", "退出登陆"];
  @override
  Widget build(BuildContext context) {
    // content.putIntoGestureDetector(listener);
    return Scaffold(
      body: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          // child: Stack().addSubWight(PersonalInfo(),top: 0,left: 0,right: 0)
          // .addSubWight(getSettingList(context),top: 280,left: 0,right: 0).putIntoContainer(height: 700)
          child: PersonalInfo().putIntoContainer(height: 300),
        ),
         SliverToBoxAdapter(
          // child: Stack().addSubWight(PersonalInfo(),top: 0,left: 0,right: 0)
          // .addSubWight(getSettingList(context),top: 280,left: 0,right: 0).putIntoContainer(height: 700)
          child: Card(child: getSettingList(context),)
        )
        
      ],
    ),
    );
 
  }

  Widget getSettingList(BuildContext context){
    return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.builder(
            
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return ItemView(settingTitles[0],
                      isShowBottomLine: true,
                      isShowLeftIcon: true,
                      leftIcon: Icon(
                        Icons.person,
                        size: 24,
                      )).putIntoGestureDetector(GestureDetector(onTapDown: (event) {
                   Navigator.pushNamed(context, "personalPage");
                  }));
                case 1:
                  return ItemView(settingTitles[1],
                      isShowBottomLine: true,
                      isShowLeftIcon: true,
                      leftIcon: Icon(
                        Icons.settings,
                        size: 24,
                      )).putIntoGestureDetector(GestureDetector(onTapDown: (event) {
                   Navigator.pushNamed(context, "setting_page");
                  }));
                case 2:
                  return ItemView(settingTitles[2],
                      isShowBottomLine: true,
                      isShowLeftIcon: true,
                      leftIcon: Icon(
                        Icons.favorite,
                        size: 24,
                      ));
                case 3:
                  return ItemView(
                    settingTitles[3],
                    isShowBottomLine: false,
                    isShowLeftIcon: true,
                    isShowRigIcon: false,
                    leftIcon: Icon(
                      Icons.exit_to_app,
                      size: 24,
                    ),
                  ).putIntoGestureDetector(GestureDetector(onTapDown: (event) {
                    showDeleteConfirmDialog1(context);
                  }));
                  break;
              }
            },
          ),
          );
  }

  Future<bool> showDeleteConfirmDialog1(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("退出登陆?"),
          content: Text("退出登陆后无法收到课程更新喔"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text(
                "退出",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                UserTool.setUserInfo(context,null);
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
                Provider.of<UserInfoProvider>(context).setLoginStatus(false);
              },
            ),
          ],
        );
      },
    );
  }
}

class PersonalInfo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalInfo();
  }
}

class _PersonalInfo extends State<PersonalInfo> {

 String userName;
 String userDesc;
 String avatarImageUrl;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserTool.getUserInfo().then(( userInfo){
      setState(() {
        userName = userInfo.userName;
        userDesc = userInfo.userDesc;
        avatarImageUrl = userInfo.avatarImage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {




    Widget buttons = Flex(direction: Axis.horizontal,)
    .addSubWight(FlatButton(child: Text("文章(10)",style:TextStyle(fontSize: 16,color:Colors.white)),onPressed:(){

    }),flex: 1)
    .addSubWight(Container(width:1,height: 10,color: Colors.white,))
    .addSubWight(FlatButton(child: Text("粉丝1.2W",style:TextStyle(fontSize: 16,color:Colors.white)),onPressed:(){

    }),flex: 1).putIntoContainer(height: 60);

  Widget avatarImage;
  if(avatarImageUrl == null) {
 avatarImage = Image(
            image: AssetImage("assets/images/ITquanxian.png"),
            // fit: BoxFit.,
            width: 100,
            height: 100,
          );
  }else{
    avatarImage = Image.network(avatarImageUrl,width: 100,height: 100,);
  }

    return Stack()
        .addSubWight(
            Image(
              image: AssetImage("assets/images/user_background1.jpg"),
              fit: BoxFit.fill,
            ),
            left: 0,
            right: 0,
            bottom: 0,
            top: 0)
        .addSubWight(
          
         avatarImage.putIntoContainer(
              width: 80,
              height: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.white)),
          left: 20,
          top: 70,
        )
        .addSubWight(Text(userName == null?"姓名":userName,style:TextStyle(fontSize: 25,color:Colors.white)),top:70,left:120)
        .addSubWight(Text(userDesc == null?"介绍你自己":userDesc,style:TextStyle(fontSize: 18,color:Colors.white)),top:110,left:120)
        .addSubWight(buttons,left: 0,right: 0,bottom: 0)
        .putIntoContainer(
            height: 300, width: double.infinity, color: Colors.grey);

  }
}

class ItemView extends StatelessWidget {
  String _title;
  bool _isShowBottomLine;
  bool _isShowLeftIcon1;
  bool _isShowRigIcon;
  Icon _leftIcon;
  Icon _rightIcon;

  ItemView(String title,
      {bool isShowBottomLine,
      bool isShowLeftIcon,
      bool isShowRigIcon,
      Icon leftIcon,
      Icon rightIcon}) {
    _title = title;
    _isShowBottomLine = isShowBottomLine != null ? isShowBottomLine : true;
    _isShowLeftIcon1 = isShowLeftIcon != null ? isShowLeftIcon : true;
    _isShowRigIcon = isShowRigIcon != null ? isShowRigIcon : true;
    _leftIcon = leftIcon;
    _rightIcon = rightIcon;
  }

  @override
  Widget build(BuildContext context) {
    Widget line = Container(
      width: double.infinity,
      height: 1,
      color: Colors.black12,
      margin: EdgeInsets.only(left: 10,right: 15),
    );
    Stack stack = Stack().addSubWight(Text(_title), left: 40, top: 24);

    if (_isShowLeftIcon1 != null && _isShowLeftIcon1 && _leftIcon != null) {
      stack = stack.addSubWight(_leftIcon, left: 10, top: 23);
    }
    if (_isShowRigIcon != null && _isShowRigIcon) {
      if (_rightIcon != null) {
        stack = stack.addSubWight(_rightIcon, right: 10, top: 10);
      } else {
        stack = stack.addSubWight(
            Icon(
              Icons.arrow_right,
              size: 24,
            ),
            right: 10,
            top: 23);
      }
    }

    Widget content = stack.putIntoContainer(
        width: double.infinity, height: 70, color: Colors.white);

    if (!_isShowBottomLine) {
      return content;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    ).addSubWight(content).addSubWight(line);
  }
}
