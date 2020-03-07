import 'dart:developer';

import 'package:FlutterDemo/model/course/category_model.dart';
import 'package:FlutterDemo/model/course/coursecategorymodel.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/view/course/categorypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'package:FlutterDemo/tool/categaory_view/lib/category_view_tool.dart';

import '../../contanst.dart';
import '../../info_provider.dart';
import 'dart:convert' as convert;

class CategoryPageHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryPageHome();
  }

  // CategoryPageHome({Key key}){
  //   this.key = key;
  // }

}

class _CategoryPageHome extends State<CategoryPageHome> {


 List<VideoCategoryModel> videoCategoryModelList = new List();
  
  List<CategoryLeftItemModel> _titles;
  List<CategoryRightModel> _subItems;
  String listKey;
  int leftSelectIndex = 0;
  @override
  Widget build(BuildContext context) {

    if (videoCategoryModelList.length <=0) {
      loadCategory(context);
    }
    
    if(videoCategoryModelList.length > 0){
      List leftList = List();
    for (var i = 0; i < videoCategoryModelList.length; i++) {
      leftList.add(videoCategoryModelList[i].name);
    }

    List rightList = List();
    for (var i = 0; i < videoCategoryModelList[leftSelectIndex].videoCategroySectionModels.length; i++) {
      rightList.add(videoCategoryModelList[leftSelectIndex].videoCategroySectionModels[i]);
    }


      CategoryViewTool categoryView = null;
       categoryView = CategoryViewTool(
      key: Key(leftSelectIndex.toString()),
      leftViewList: leftList,
      rightViewList: rightList,
      leftItemBuilder:
          (BuildContext context, List itemList, int index, bool isSelect) {
        if (isSelect) {
          Stack content = Stack()
              .addSubWight(
                  Container(
                    color: Provider.of<AppInfoProvide>(context)
                        .getAppPrimarySwatch(),
                    width: 5,
                    height: 20,
                  ),
                  left: 0,
                  top: 20)
              .addSubWight(Center(child: Text(itemList[index])),
                  left: 10, top: 20);

          Stack item = Stack()
              .addSubWight(content.putIntoContainer(height: 60))
              .addSubWight(
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black12,
                  ),
                  bottom: 0,
                  left: 0,
                  right: 0);

          return item.putIntoContainer(height: 60,width: 100, color: Colors.white);
        } else {
          Stack item = Stack()
              .addSubWight(
                  Center(child: Text(itemList[index]))
                      .putIntoContainer(height: 60),
                  left: 10)
              .addSubWight(
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.black12,
                  ),
                  bottom: 0,
                  left: 0,
                  right: 0);

          return item.putIntoContainer(height: 60, color: Colors.white);
        }
      },
      rightViewHeaderBuilder: (BuildContext context) {
        List<VideoCategoryBannerItemModels> videoCategoryBannerItemModels =videoCategoryModelList[leftSelectIndex].videoCategoryBannerItemModels;
        if (videoCategoryBannerItemModels == null || videoCategoryBannerItemModels.length <= 0) {
          return Container();
        }
        return Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              videoCategoryBannerItemModels[index].imageUrl,
              fit: BoxFit.fitWidth,
            );
          },
          itemCount: videoCategoryBannerItemModels.length,
          autoplay: true,
          pagination: new SwiperPagination(),
          control: new SwiperControl(iconPrevious: null, iconNext: null),
        ).putIntoContainer(
            margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 20),
            height: 100);
      },
      rightItemBuilder: (BuildContext context, List itemList, int index) {
        Column content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        );
        VideoCategroySectionModels section = itemList[index];
        content = content
            .addSubWight(Text(section.name).putIntoContainer(height: 30));

        Wrap itemContent = Wrap(
          spacing: 10,
          runSpacing: 10,
        );
        VideoCategroySectionModels sectionModel = itemList[index];
        for (var i = 0; i < sectionModel.videoCategoryItemModels.length; i++) {
        
          LayoutBuilder item = LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Column()
                  .addSubWight( Image(
                      image: sectionModel.videoCategoryItemModels[i].imageUrl == null ? AssetImage(""):NetworkImage(sectionModel.videoCategoryItemModels[i].imageUrl),
                      fit: BoxFit.fitWidth,
                      width: constraints.maxWidth / 3 - 10,
                      height: constraints.maxWidth / 3 - 10))
                  .addSubWight(Center(
                    child: Text(sectionModel.videoCategoryItemModels[i].title == null ? "":sectionModel.videoCategoryItemModels[i].title),
                  ).putIntoContainer(height: 30, width: 70));
            },
          );

          itemContent = itemContent.addSubWight(item);
        }
        content = content.addSubWight(itemContent);

        return content.putIntoContainer(
            width: double.infinity, margin: EdgeInsets.all(10));
      },
      clickLeftItem: (context, itemList, index) {

  this.leftSelectIndex = index;
  listKey = index.toString();
           List rightViewList = List();
    for (var i = 0; i < videoCategoryModelList[index].videoCategroySectionModels.length; i++) {
      rightViewList.add(videoCategoryModelList[index].videoCategroySectionModels[i]);
    }
    log(rightViewList.length.toString());
          categoryView.updateRightList(rightViewList);
        setState(() {
          
        
        });
      },
    );
    return Scaffold(
        // appBar:AppBar(
        //   title:Text("重置密码"),
        // ),
        body: categoryView.putInfoSaveArea());
    }else{
      return Container();
    }
   

  }

  void loadCategory(BuildContext context) {
    NetWorkTool netWorkTool = NetWorkTool();
    netWorkTool.netWorkCallback = (response, error) {
      String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
      if (map != null) {
        if (map['resultCode'] == "200") {
          List resultList = (map["result"]);
          for (var i = 0; i < resultList.length; i++) {
            VideoCategoryModel model = VideoCategoryModel.fromJson(resultList[i]);
            videoCategoryModelList.add(model);
          }
          
          
          setState(() {
        //  this.hotSearchList = result;
          });
        }
      } else {
      
      }
    };
    netWorkTool.post(category_home_url, {
    });
  }
}
