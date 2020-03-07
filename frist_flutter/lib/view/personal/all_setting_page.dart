import 'package:FlutterDemo/model/usermodel.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'package:FlutterDemo/main.dart';
import '../../info_provider.dart';
import 'detal_info.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SettingPage();
  }
}

class _SettingPage extends State<SettingPage> {
  String avatarImageUrl;
  String userName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("设置"),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(child: getInfomationArea()),
            SliverToBoxAdapter(child: Container(height: 40,)),
            SliverToBoxAdapter(child: getSettingList())
            ],
        ).putIntoContainer(color: Color.fromRGBO(242, 247, 250, 1)));
  }

  Widget getInfomationArea() {
    Widget imageWidght = Image(
                  image: avatarImageUrl == null ? AssetImage("assets/images/ITquanxian.png"):NetworkImage(avatarImageUrl),
                  width: 40,
                  height: 40,
                );
          
    UserTool.getUserInfo().then((userModel){
      if (userModel != null  && userModel.avatarImage != null) {
       setState(() {
         avatarImageUrl = userModel.avatarImage;
         userName = userModel.userName;
       });
      }
    });
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    )
        .addSubWight(Stack()
            .addSubWight(Text("个人信息", style: TextStyle(fontSize: 22)),
                top: 10, left: 10)
            .putIntoContainer(height: 60))
        .addSubWight(Card(
            child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Stack()
                .addSubWight(ClipOval(child: imageWidght,).putIntoContainer(width: 50,height: 50),top: 25,left: 10)
                .addSubWight(Text(userName == null ? "":userName,style: TextStyle(fontSize: 20),),top: 30,left: 70)
                .putIntoContainer(height: 90),
            //分割线
            Container(
              height: 1,
              color: Colors.black12,
              margin: EdgeInsets.only(left: 15, right: 15),
            ),
            
            Stack()
                .addSubWight(Text("设置个人信息"), top: 24,left: 15)
                .addSubWight(IconButton(icon:Icon(Icons.arrow_forward_ios,size: 15,)),right: 10,top: 8)
                .putIntoContainer(height: 70,color: Colors.white).putIntoGestureDetector(GestureDetector(onTapDown: (event){
                  Navigator.pushNamed(context, "PersonalInfoSetting");
                },)),
          ],
        )).putIntoContainer(
            margin: EdgeInsets.only(left: 10, right: 10),
            ))
        .putIntoContainer();
  }

  Widget getSettingList() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    )
        .addSubWight(Stack()
            .addSubWight(Text("应用设置", style: TextStyle(fontSize: 22)),
                top: 10, left: 10)
            .putIntoContainer(height: 60))
        .addSubWight(Card(
            child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Stack()
                .addSubWight(Text("切换主题"), top: 24,left: 15)
                .addSubWight(IconButton(icon:Icon(Icons.arrow_forward_ios,size: 15,),),right: 0,top: 11)
                .putIntoContainer(height: 70,color: Colors.white).putIntoGestureDetector(GestureDetector(
                  onTapDown: (event){
                    showChangeTheme();
                  },
                )),
            //分割线
            Container(
              height: 1,
              color: Colors.black12,
              margin: EdgeInsets.only(left: 15, right: 15),
            ),
            Stack()
                .addSubWight(Text("消息通知"), top: 24,left: 15)
                .addSubWight(Switch(value: true,onChanged: (value){

                },),right: 0,top: 11)
                .putIntoContainer(height: 70,),
            //分割线
            Container(
              height: 1,
              color: Colors.black12,
              margin: EdgeInsets.only(left: 15, right: 15),
            ),
           Stack()
                .addSubWight(Text("去评分"), top: 24,left: 15)
                .addSubWight(IconButton(icon:Icon(Icons.arrow_forward_ios,size: 15,)),right: 0,top: 11)
                .putIntoContainer(height: 70,),
            //分割线
            Container(
              height: 1,
              color: Colors.black12,
              margin: EdgeInsets.only(left: 15, right: 15),
            ),
            Stack()
                .addSubWight(Text("清除缓存"), top: 24,left: 15)
                .addSubWight(IconButton(icon:Icon(Icons.arrow_forward_ios,size: 15,)),right: 0,top: 11)
                .putIntoContainer(height: 70,),
            //分割线
            Container(
              height: 1,
              color: Colors.black12,
              margin: EdgeInsets.only(left: 15, right: 15),
            ),
           Stack()
                .addSubWight(Text("关于我们"), top: 24,left: 15)
                .addSubWight(IconButton(icon:Icon(Icons.arrow_forward_ios,size: 15,)),right: 0,top: 11)
                .putIntoContainer(height: 70,),
          
           
          ],
        )).putIntoContainer(
            margin: EdgeInsets.only(left: 10, right: 10),
            ))
        .putIntoContainer();
  }

  Future showChangeTheme(){
    return showModalBottomSheet(
      context: context,
      builder: (context){
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.close,color: Colors.black,),onPressed: (){
              Navigator.pop(context);
            },),
            title: Text("点击选择主题颜色",style: TextStyle(color: Colors.black),),
            backgroundColor: Colors.white,
          ),
          body: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            getColorsWidget(Colors.red),
            getColorsWidget(Colors.pink),
            getColorsWidget(Colors.purple),
            getColorsWidget(Colors.deepPurple),
            getColorsWidget(Colors.indigo),
            getColorsWidget(Colors.blue),
            getColorsWidget(Colors.lightBlue),
            getColorsWidget(Colors.cyan),
            getColorsWidget(Colors.teal),
            getColorsWidget(Colors.lightGreen),
            getColorsWidget(Colors.lime),
            getColorsWidget(Colors.yellow),
            getColorsWidget(Colors.amber),

            getColorsWidget(Colors.orange),
            getColorsWidget(Colors.deepOrange),
            getColorsWidget(Colors.blueGrey),
           

          ],
        ),
        );
      }
    );
  }

  Widget getColorsWidget(Color color){
    return Container(
      color: color,
    ).putIntoGestureDetector(GestureDetector(
      onTapDown: (event){
        Provider.of<AppInfoProvide>(context).setAppPrimarySwatch(color);
      },
    ));

  }
}
