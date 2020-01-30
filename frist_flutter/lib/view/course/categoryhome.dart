import 'dart:developer';

import 'package:FlutterDemo/model/course/coursecategorymodel.dart';
import 'package:FlutterDemo/view/course/categorypage.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

class CategoryPageHome extends StatelessWidget {

   List<CategoryLeftItemModel> _titles;
  List<CategoryRightModel> _subItems;

  @override
  Widget build(BuildContext context) {
    _titles = [CategoryLeftItemModel("1","IT"), CategoryLeftItemModel("2","乐理"), CategoryLeftItemModel("3","语言")];
    
    _subItems = [
      CategoryRightModel(CategoryRightTitleModel("234", "标题好啊哈"),
       [CategoryRightItemModel("id1","子项目1"),
       CategoryRightItemModel("id1","子项目2"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),
       CategoryRightItemModel("id1","子项目3"),]),
      // CategoryRightModel(titles[_selectIndex],   [{"id1":"子项目"}])
      // CategoryRightModel(_titles[0], [CategoryRightItemModel("id1","子项目")]),
    ];
    // TODO: implement build
    log(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      // appBar:AppBar(
      //   title:Text("重置密码"),
      // ),
      body:
      // Column().
      // addSubWight(Container(height: 40,width: double.infinity,color: Colors.red,)).
      // addSubWight(Container(height: 40,width: double.infinity,color: Colors.red,))
      
      CategoryView(70,_titles,_subItems)
      
    );
  }
  
}