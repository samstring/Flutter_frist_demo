import 'dart:developer';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/course/coursecategorymodel.dart';
import 'package:FlutterDemo/model/course/coursemodel.dart';
import 'package:FlutterDemo/view/course/coursedetail.dart';
import 'package:FlutterDemo/view/course/coursevideo.dart';
import 'package:flutter/material.dart';
import 'package:FlutterDemo/tool/sfviewtool/lib/sfviewtool.dart';

class CourseCategoryDetaiPage extends StatefulWidget  {
  
  CategoryRightModel _subItemModel;
  int _selectedIndex;


  
  // @override
  // void initState() {
  //   super.initState();
  //   // 创建Controller  
    
  // }

  CourseCategoryDetaiPage(CategoryRightModel subItemModel,int selectIndex){
   _subItemModel = subItemModel;
   _selectedIndex = selectIndex;

   
  }

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   return TabBarView(
  //     children: tabPages,
  //   );
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CourseCategoryDetaiPage(_subItemModel,_selectedIndex);
  }
  
}

class _CourseCategoryDetaiPage extends State<CourseCategoryDetaiPage> with TickerProviderStateMixin{

CategoryRightModel _subItemModel;
  int _selectedIndex;

    TabController _tabController;
  List<Text> _tabsTItles = List();
  List<Widget> _tabPages = List();

  _CourseCategoryDetaiPage(CategoryRightModel subItemModel,int selectIndex){
   _subItemModel = subItemModel;
   _selectedIndex = selectIndex;
  }



  @override
  Widget build(BuildContext context) {
    _tabsTItles = List();
    _tabPages = List();
   for (var i = 0; i < _subItemModel.subItems.length; i++) {
     _tabsTItles.add(Text(_subItemModel.subItems[i].title));
     _tabPages.add(CourseListPage());
   }

   _tabController = TabController(length: _tabPages.length, vsync: this);

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        key: PageStorageKey(_subItemModel.titleModel.title),
        title: Text(_subItemModel.titleModel.title),
        actions: <Widget>[
        
        IconButton(
          icon: Icon(Icons.filter_list,color: Colors.white,),
          onPressed: (){

          },
          ),
          IconButton(
          icon: Icon(Icons.filter_list,color: Colors.white,),
          onPressed: (){
            
          },
          )
        ],
        bottom: TabBar(
  
          isScrollable: true,
      controller: _tabController,
      tabs: _tabsTItles
  )
      ),
      body: TabBarView(
        key: PageStorageKey(_subItemModel.titleModel.title),
        controller: _tabController,
        children:_tabPages,
      ),
    );
  }  
}


class CourseListPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget dividerLine=Divider(color: Colors.black12,height: 1,);

    return Container(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return dividerLine;
        },
        itemBuilder:(BuildContext context, int index) {
          CourseModel model = CourseModel();
          model.courseTitle = "标题";
          model.imageUrl = "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/3-17.png";
          model.courseDesc = "内容";
          return CourseListItemView(model).putIntoGeustureDetector(GestureDetector(
        onTapDown:(event){
          log("点击第$index");
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CourseDetailPage();
          }));
       
        }));
          },
        itemCount: 100,
  
      ),
    );
  }
  
}

class CourseListItemView  extends StatelessWidget{
  double _height = 80;
  CourseModel _itemModel;

CourseListItemView(CourseModel itemModel){
  _itemModel = itemModel;
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Row contentView =Row().addSubWight(
      Image.network(
        _itemModel.imageUrl == null ? "":_itemModel.imageUrl,
      ).putIntoContainer(width: 100,height: 60,color: mainColor,margin: EdgeInsets.only(left: 10,top: 10,right: 10))
    ).addSubWight(
      Column(crossAxisAlignment: CrossAxisAlignment.start,).addSubWight(Text(_itemModel.courseTitle == null ? "":_itemModel.courseTitle))
      .addSubWight(
        Text(_itemModel.courseDesc== null ? "":_itemModel.courseDesc,style: TextStyle(fontSize: 12),)
        // Expanded(child: Text(_itemModel.courseDesc== null ? "":_itemModel.courseDesc,).putIntoContainer(color:mainColor),)
      ).putIntoContainer(height: 60,margin: EdgeInsets.only(top: 10,right: 10),)
    );
    
    Stack item = Stack().addSubWight(contentView).addSubWight(Container(color: Colors.black12,height: 1,),bottom: 1,left: 10,right: 10);
    return item.putIntoContainer(height: _height,color: Colors.white);
  }
}
