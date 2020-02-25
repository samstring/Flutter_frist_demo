import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

typedef ItemBuilder = Widget Function(int index);

class DefalutChatInputToolView extends StatelessWidget {
  // _DefalutChatInputToolView _defalutChatInputToolView;
  final double tooviewHeight;
  final int itemCount;
  final ItemBuilder itemBuilder;

  DefalutChatInputToolView(
      this.tooviewHeight, this.itemCount, this.itemBuilder) {
    log("message " + tooviewHeight.toString());

    //  _defalutChatInputToolView = _DefalutChatInputToolView(tooviewHeight);
    // _defalutChatInputToolView.toolviewHeight = tooviewHeight;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List();
    //如果数量为空，返回空视图
    if (itemCount == null  || itemCount <= 0 || tooviewHeight == 0) {
      return Container();
    }
    if ((itemBuilder != null)) {
      for (int i = 0; i < itemCount; i++) {
        Widget item = itemBuilder(i);
        if (item != null) {
          items.add(item);
        }
      }
    }

    
    int itemSpace = 10;

    

    int pageCount = (items.length ~/ 8).toInt();
    if(pageCount == 0 && items.length != 0){
      pageCount = 1;
    }

    List<Widget> pageList = List();

    for(int i = 0;i < pageCount;i++){
    Widget content = LayoutBuilder(builder: (context,constrait){ 
    Wrap toolViewWrap = Wrap();

    for(int t = 8*i;t < items.length;t++){
      log("message"+(items[i] == null).toString());
      toolViewWrap = toolViewWrap.addSubWight(
        items[t].putIntoContainer(
          width: (constrait.maxWidth-itemSpace*5)/4,
          height: (tooviewHeight - itemSpace*3)/2,
          color: Colors.black,
          margin: EdgeInsets.only(left: 10,bottom: 10)
        ));
    }
    return toolViewWrap;
    });

    pageList.add(content);
    }

    return PageView(children:pageList).putIntoContainer(height: this.tooviewHeight-10, width: double.infinity);
  }

  Widget getColorsWidget(Color color) {
    return Container(
      color: color,
    ).putIntoGestureDetector(GestureDetector(
      onTapDown: (event) {},
    ));
  }
}
