import 'dart:developer';

import 'package:FlutterDemo/global.dart';
import 'package:FlutterDemo/model/sfmodel.dart';
import 'package:FlutterDemo/tool/erropage.dart';
import 'package:FlutterDemo/view/chat/chat_page.dart';
import 'package:FlutterDemo/view/course/course_canlendar.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:FlutterDemo/view/personal/personal_page.dart';
import 'package:FlutterDemo/view/personal/personal_setting_page.dart';
import 'package:FlutterDemo/view/personal/all_setting_page.dart';
import 'package:FlutterDemo/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:FlutterDemo/view/personal/login.dart';
import 'package:FlutterDemo/view/MainTab.dart';
import 'package:provider/provider.dart';
import 'info_provider.dart';
import 'model/usermodel.dart';
import 'package:sfviewtool/sfviewtool.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalTool.initGloble().then((e) {
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => UserInfoProvider()),
        ChangeNotifierProvider(builder: (_) => AppInfoProvide()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatefulWidget {
  Color primarySwatch = Colors.green;
  setAppPrimarySwatch(Color color) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    {
      AppInfoProvide infoProvider = Provider.of<AppInfoProvide>(context);
      bool isExitLoginInfo = GlobalTool.isLogin;
      UserModel userModel = Provider.of<UserInfoProvider>(context).user;
      return MaterialApp(
          onGenerateRoute: (RouteSettings settings) {
            return RouteManger.getRoute(settings);
          },
          // initialRoute: ,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: infoProvider.getAppPrimarySwatch(),
          ),
          home: (isExitLoginInfo == true ||
                  (userModel != null && userModel.b_Id != null))
              ? MainTabPage()
              : CourseloginPage());
    }
  }
}

//路由管理器
class RouteManger {
  static String loginPageString = "loginPage";
  static PageRoute<dynamic> getRoute(RouteSettings settings) {
    var page;

    if (settings.name == loginPageString) {
      page = CourseloginPage();
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, Animation<double> a1,
              Animation<double> a) {
            return page;
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
              // child: RotationTransition(
              //   turns: Tween<double>(begin: 0.5, end: 1.0)
              //       .animate(animation),
              //   child: child,
              // ),
            );
          });
    }

    if (settings.name == "SearchPage") {
      page = SearchPage();
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, Animation<double> a1,
              Animation<double> a) {
            return page;
          },
          transitionsBuilder:
              (___, Animation<double> animation, ____, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
              // child: RotationTransition(
              //   turns: Tween<double>(begin: 0.5, end: 1.0)
              //       .animate(animation),
              //   child: child,
              // ),
            );
          });
    }

    if (settings.name == "homePage") {
      page = MainTabPage();
    }

    if (settings.name == "ChatPage") {
      page = ChatPage();
    }

    if (settings.name == "coursePage") {
//      if(GlobalTool.isLogin == true){
// page = CourseDetailPage();
//      }else{
//        page = CourseloginPage();
//      }
      page = CourseDetailPage();
    }

    if (settings.name == "personalPage") {
      page = PersonalPage();
    }

    if (settings.name == "CourseCalendar") {
      page = CourseCalendar();
    }

    if (settings.name == "setting_page") {
      page = SettingPage();
    }

    if (settings.name == "PersonalInfoSetting") {
      page = PersonalInfoSetting();
    }

    //如果找不到相应的路由，则设置为空
    if (page == null) {
      page = ErrorPage("找不到相关页面");
    }

    return MaterialPageRoute(builder: (BuildContext context) {
      return page;
    });
  }
}
