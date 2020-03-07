import 'dart:developer';
import 'dart:math';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:flutter/material.dart';
import 'package:search_pageview/search_page.dart';
import 'dart:convert' as convert;

class SearchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchPage();
  }
}

class _SearchPage extends State<SearchPage> {
 List<String> hotSearchList = List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //  = ["热门搜索1","热门搜索2","热门搜索3"];
 if (hotSearchList == null || hotSearchList.length == 0) {
        loadSearchWord(context);
      }
      
    return Scaffold(
     
      
      body: 
      SafeArea(
        child: SearchViewPage(
          hotSearchWordList: hotSearchList,
          hotSearchType: SearchContentType.tagType,//热门搜索以标签，立标或是自定义方式去显示
          hitoryType: SearchContentType.listType,//历史搜索以标签，立标或是自定义方式去显示
          isShowHistoryItemDeleteAllButton: true,//是否显示删除全部历史按钮，默认是true
          isShowHistoryToTop: true,//交换热门与搜索位置
          // hotSearchType: SearchContentType.customerType,
          // hotSearchBuilder: (//自定义热门搜索视图
          //     List hotSearchWordList){ 
          //       return Container(height: 300,color: Colors.red,);
          //       }

          clickCancelBlock: (BuildContext context1){
            print("点击取消");
            Navigator.pop(context1);
          },

          clickSearchBlock: (BuildContext context1,String text){
            print("点击搜索");
            print(text);
            // Navigator.pop(context);
          },
          clickItemBlock:  (BuildContext context1,List itemList,int index,bool isHistory){
            print(itemList[index]);
             FocusScope.of(context).requestFocus(FocusNode());
          },
          )
      )
      );
  }

  void loadSearchWord(BuildContext context) {
    NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          List resultList = (map["result"]);
          for (var i = 0; i < resultList.length; i++) {
            this.hotSearchList.add(resultList[i]);
          }
          
          setState(() {
        //  this.hotSearchList = result;
          });
        }
      } else {
      
      }
    };
    netWorkTool.post(searchword_url, {
    });
  }
  
}