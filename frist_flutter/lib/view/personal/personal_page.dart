
import 'package:FlutterDemo/view/personal/detal_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

class PersonalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PersonalPage();
  }
}

class _PersonalPage extends State<PersonalPage> {
  List<Widget> pages = List();
  List<Widget> pageTitles = List();
  Widget headerView;
  List<Widget> actions;

   initState(){
       pages.add(Container(height: 19,));
    pages.add(Container(height: 199,));

    pageTitles.add(Text("文章"));
    pageTitles.add(Text("收藏"));

    headerView = getHeader();
    }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DetailInfo(
      pageTitle: Text("个人信息"),
      tabPages: pages,
      tabTitles: pageTitles,
      headerView: headerView,
      bottomView: null,
      actions: <Widget>[],
      intinialSelectedIndex: 0,
    );
  }

  Widget getHeader() {
    Widget buttons = Flex(
      direction: Axis.horizontal,
    )
        .addSubWight(
            FlatButton(
                child: Text("文章(10)",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {}),
            flex: 1)
        .addSubWight(Container(
          width: 1,
          height: 10,
          color: Colors.white,
        ))
        .addSubWight(
            FlatButton(
                child: Text("粉丝1.2W",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () {}),
            flex: 1)
        .putIntoContainer(height: 60);

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
          Image(
            image: AssetImage("assets/images/ITquanxian.png"),
            // fit: BoxFit.,
            width: 100,
            height: 100,
          ).putIntoContainer(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white)),
          left: 20,
          top: 120,
        )
        .addSubWight(
            Text("姓名", style: TextStyle(fontSize: 28, color: Colors.white)),
            top: 120,
            left: 120)
        .addSubWight(
            Text("一句话介绍你自己",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            top: 160,
            left: 120)
        // .addSubWight(buttons,left: 0,right: 0,bottom: 0)
        .putIntoContainer(
            height: 300, width: double.infinity, color: Colors.grey);
  }
}
