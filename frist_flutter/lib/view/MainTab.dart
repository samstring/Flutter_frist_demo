import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/global.dart';
import 'package:FlutterDemo/view/course/categoryhome.dart';
import 'package:FlutterDemo/view/my/mycourse.dart';
import 'package:FlutterDemo/view/personal/personalinfo.dart';
import 'package:FlutterDemo/view/home/HomePage.dart';
import 'package:FlutterDemo/view/login.dart';
import 'package:FlutterDemo/view/resetpassword.dart';
import 'package:FlutterDemo/view/sarchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/search/search_page.dart';

class MainTabPage extends StatefulWidget{

@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainTabPage();
  }

}

class _MainTabPage extends State<MainTabPage> with SingleTickerProviderStateMixin{
  int currentIndex = 0;
  List<Widget> pages = List<Widget>();
  List<String> titles = ["首页","分类","我的课程","我的"];

  @override
  void initState() {
    pages..add(HomePage())..add(SearchViewPage(
      hotSearchWordList: ["3,"],hotSearchTitle: "热门啦",hitoryRecordCount: 3,
      cancelTitle: "cancel",
      ))..add(MyCoursePage())..add(PersonalInfoPage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget searchBar;
//     if(currentIndex == 0){
//       searchBar = new AppBar(
// //      centerTitle: true,
//       backgroundColor: Colors.white,
//       title: TextFileWidget(),
//       automaticallyImplyLeading: false,);

//     }else
     if(currentIndex == 3){
      searchBar = null;
    }
    else{
     searchBar =  AppBar(
        title: Text(titles[currentIndex]),
      );
    }

    return Scaffold(
      appBar: searchBar,
      body: pages[currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex:currentIndex,
        activeColor: GlobalTool.mainColor,
        inactiveColor: Colors.black,
        onTap: _onItemSelect,
        items:<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text(titles[0])),
          BottomNavigationBarItem(icon: Icon(Icons.category),title: Text(titles[1])),
          BottomNavigationBarItem(icon: Icon(Icons.color_lens),title: Text(titles[2])),
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text(titles[3])),
        ],
      ),
    );
  }

  void _onItemSelect(int index){
    setState(() {
      currentIndex = index;
     
    });
  }

  

}