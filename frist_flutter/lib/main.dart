import 'dart:developer';

import 'package:FlutterDemo/global.dart';
import 'package:FlutterDemo/tool/erropage.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:FlutterDemo/view/personal/personal_page.dart';
import 'package:FlutterDemo/view/personal/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:FlutterDemo/view/login.dart';
import 'package:FlutterDemo/view/MainTab.dart';
import 'package:provider/provider.dart';
import 'info_provider.dart';
import 'model/usermodel.dart';
import 'package:sfviewtool/sfviewtool.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
    GlobalTool.initGloble().then(
    (e){
      return runApp(

        ChangeNotifierProvider<AppInfoProvide>.value(//1
    notifier: AppInfoProvide(),//2
    child: MyApp(),
  )
    // MyApp());
    // MultiProvider(providers: [
    //       ChangeNotifierProvider(builder: (_) => AppInfoProvide()),
    //     ], child: MyApp())
        );
    }
   );
 
//  MultiProvider(providers: [
//           ChangeNotifierProvider(builder: (_) => AppInfoProvide()),
//         ], child: PageContentArea());
}



class MyApp extends StatefulWidget {
   Color primarySwatch = Colors.green;
   setAppPrimarySwatch(Color color){
    
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }
  
}

class _MyApp extends State<MyApp>{
  

  @override
  Widget build(BuildContext context) {
    {
      AppInfoProvide infoProvider = Provider.of<AppInfoProvide>(context);
      log("-------"+infoProvider.toString());
    return MaterialApp(
      
      onGenerateRoute: (RouteSettings settings){
        return RouteManger.getRoute(settings);
      },
      // initialRoute: ,
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: infoProvider.primarySwatchColor,
        // primarySwatch: Provider.of<AppInfoProvide>(context).primarySwatchColor
      ),
      // home:GlobalTool.isLogin == true ? MainTabPage():CourseloginPage()
      home: MainTabPage(),
    );
  }
  }

}

//路由管理器
class RouteManger{
  static String loginPageString = "loginPage";
  static PageRoute<dynamic> getRoute(RouteSettings settings){
    var page;

    if(settings.name == loginPageString){
      page = CourseloginPage();
      return PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context,Animation<double> a1,Animation<double> a){
        return  page;
      },
      transitionsBuilder: (___, Animation<double> animation,
                          ____, Widget child) {
                        return FadeTransition(
                          opacity: animation,
                          child:child,
                          // child: RotationTransition(
                          //   turns: Tween<double>(begin: 0.5, end: 1.0)
                          //       .animate(animation),
                          //   child: child,
                          // ),
                        );
                          }        
    );
    }

    if(settings.name == "homePage"){
      page = MainTabPage();
    }

    if(settings.name == "coursePage"){
//      if(GlobalTool.isLogin == true){
// page = CourseDetailPage();
//      }else{
//        page = CourseloginPage();
//      }
page = CourseDetailPage();

    }

    if(settings.name == "personalPage"){
      page = PersonalPage();
    }

    if(settings.name == "setting_page"){
      page = SettingPage();
    }

    //如果找不到相应的路由，则设置为空
    if(page == null){
      page = ErrorPage("找不到相关页面");

    }


    return MaterialPageRoute(builder: (BuildContext context){
      return page;
    });

    
    
  }
}
