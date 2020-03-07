import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

const double LeftWidth = 80;
typedef LeftViewHeaderBuilder = Widget Function(BuildContext context);
typedef LeftViewBottomBuilder = Widget Function(BuildContext context);
typedef LeftItemBuilder = Widget Function(
    BuildContext context, List itemList, int index, bool isSelect);

typedef RightViewHeaderBuilder = Widget Function(BuildContext context);
typedef RightViewBottomBuilder = Widget Function(BuildContext context);
typedef RightItemBuilder = Widget Function(
  BuildContext context,
  List itemList,
  int index,
);
typedef RightItemHeaderBuilder = Widget Function(
  BuildContext context,
  List itemList,
  int index,
);
typedef RightItemBottomBuilder = Widget Function(
  BuildContext context,
  List itemList,
  int index,
);

enum ChangeState{
  chageStateNormal,
  chageStatePre,
  chagetStateNext,
  
}

typedef ClickLeftItem = Function(
    BuildContext context, List itemList, int index);
typedef ClickRightItem = Function(
    BuildContext context, List itemList, int index);
typedef ClickRightItemHeader = Function(
    BuildContext context, List itemList, int index);
typedef ClickRightItemBottom = Function(
    BuildContext context, List itemList, int index);

typedef ClickLeftHeader = Function(BuildContext context);
typedef ClickLeftBottom = Function(BuildContext context);

typedef ClickRightHeader = Function(BuildContext context);
typedef ClickRightBottom = Function(BuildContext context);

class CategoryViewTool extends StatefulWidget {
   LeftViewHeaderBuilder leftViewHeaderBuilder;
   LeftViewBottomBuilder leftViewBottomBuilder;
   LeftItemBuilder leftItemBuilder;

   RightViewHeaderBuilder rightViewHeaderBuilder;
   RightViewBottomBuilder rightViewBottomBuilder;
   RightItemBuilder rightItemBuilder;
   RightItemHeaderBuilder rightItemHeaderBuilder;
   RightItemBottomBuilder rightItemBottomBuilder;

   ClickLeftItem clickLeftItem;
   ClickRightItem clickRightItem;
   ClickRightItemHeader clickRightItemHeader;
   ClickRightItemBottom clickRightItemBottom;

   ClickLeftHeader clickLeftHeader;
   ClickLeftBottom clickLeftBottom;
   ClickRightHeader clickRightHeader;
   ClickRightBottom clickRightBottom;

   List leftViewList;
   List rightViewList;

  _CategoryViewTool _categoryViewTool;

  double leftViewWidth;

  CategoryViewTool(
      {Key key,
      this.leftViewHeaderBuilder,
      this.leftViewBottomBuilder,
      this.leftItemBuilder,
      this.rightViewHeaderBuilder,
      this.rightViewBottomBuilder,
      this.rightItemBuilder,
      this.rightItemHeaderBuilder,
      this.rightItemBottomBuilder,
      this.clickLeftItem,
      this.clickRightItem,
      this.clickRightItemHeader,
      this.clickRightItemBottom,
      this.clickLeftHeader,
      this.clickLeftBottom,
      this.clickRightHeader,
      this.clickRightBottom,
      this.leftViewList,
      this.rightViewList,
      this.leftViewWidth}) {
    if (this.leftViewWidth == null) this.leftViewWidth = LeftWidth;

    _categoryViewTool = _CategoryViewTool(
        leftViewHeaderBuilder,
        leftViewBottomBuilder,
        leftItemBuilder,
        rightViewHeaderBuilder,
        rightViewBottomBuilder,
        rightItemBuilder,
        rightItemHeaderBuilder,
        rightItemBottomBuilder,
        clickLeftItem,
        clickRightItem,
        clickRightItemHeader,
        clickRightItemBottom,
        clickLeftHeader,
        clickLeftBottom,
        clickRightHeader,
        clickRightBottom,
        leftViewList,
        rightViewList,
        leftViewWidth);
  }

  updateRightList(List rightViewList){
    this.rightViewList = rightViewList;
    _categoryViewTool.updateRightList(rightViewList);
    _categoryViewTool._rightScrollController.jumpTo(0);
    
  }

  updateLeftList(List leftViewList){
    this.leftViewList = leftViewList;
    _categoryViewTool.leftViewList = leftViewList;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //重新执行
    return _categoryViewTool;
  }

  void setSelectIndex(int index) {
    _categoryViewTool.setSelectIndex(index);
  }
}

class _CategoryViewTool extends State<CategoryViewTool> {
   LeftViewHeaderBuilder leftViewHeaderBuilder;
   LeftViewBottomBuilder leftViewBottomBuilder;
   LeftItemBuilder leftItemBuilder;

   RightViewHeaderBuilder rightViewHeaderBuilder;
   RightViewBottomBuilder rightViewBottomBuilder;
   RightItemBuilder rightItemBuilder;
   RightItemHeaderBuilder rightItemHeaderBuilder;
   RightItemBottomBuilder rightItemBottomBuilder;

   ClickLeftItem clickLeftItem;
   ClickRightItem clickRightItem;
   ClickRightItemHeader clickRightItemHeader;
   ClickRightItemBottom clickRightItemBottom;

   ClickLeftHeader clickLeftHeader;
   ClickLeftBottom clickLeftBottom;
   ClickRightHeader clickRightHeader;
   ClickRightBottom clickRightBottom;

   List leftViewList;
   List rightViewList;
   double leftViewWidth;

  int selectIndex = 0;

  double _rightHeaderPreHeight = 0;
  double _rightBottomNextHeight = 0;

  double changeHeight = 30;
  double rightContentHeiht = 0;

  ChangeState _changeState;
  ScrollController _rightScrollController ;

  void setSelectIndex(int index) {
    setState(() {
      this.selectIndex = index;
      _rightScrollController.jumpTo(0);
    });
  }

  void updateRightList(List rightList){
    // setState(() {
      this.rightViewList = rightList;
      
    // });
  }

  _CategoryViewTool(
      this.leftViewHeaderBuilder,
      this.leftViewBottomBuilder,
      this.leftItemBuilder,
      this.rightViewHeaderBuilder,
      this.rightViewBottomBuilder,
      this.rightItemBuilder,
      this.rightItemHeaderBuilder,
      this.rightItemBottomBuilder,
      this.clickLeftItem,
      this.clickRightItem,
      this.clickRightItemHeader,
      this.clickRightItemBottom,
      this.clickLeftHeader,
      this.clickLeftBottom,
      this.clickRightHeader,
      this.clickRightBottom,
      this.leftViewList,
      this.rightViewList,
      this.leftViewWidth);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _rightScrollController = ScrollController(initialScrollOffset: 0);
    // _rightScrollController.addListener(() {
    //   if(_rightScrollController.offset < -100){
    //     _rightScrollController.jumpTo(-100);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildContainer();
  }

  /// 构建内容视图
  Widget buildContainer() {
    return Flex(direction: Axis.horizontal)
        .addSubWight(buildLeftView(context, leftViewList, leftViewWidth))
        .addSubWight(buildRightView(context, rightViewList), flex: 1);
  }

 

  Widget buildLeftView(BuildContext context, List itemList, double width) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: <Widget>[
        SliverToBoxAdapter(
            child: leftViewHeaderBuilder == null
                ? Container()
                : leftViewHeaderBuilder(context).putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
                      if (clickLeftHeader != null) {
                        clickLeftHeader(context);
                      }
                    },
                  ))),
        SliverToBoxAdapter(
          child: Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemList == null ? 0 : itemList.length,
              itemBuilder: (BuildContext context, int index) {
                if (leftItemBuilder != null) {
                  bool isSelect = (selectIndex == index);
                  return leftItemBuilder(context, leftViewList, index, isSelect)
                    .putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){

 if(this.clickLeftItem != null){
            
                        clickLeftItem(context,itemList,index);
                      }

                      setState(() {
                        selectIndex = index;
                      });
                     
                    },
                  ));
                }
              },
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: leftViewBottomBuilder == null
              ? Container()
              : leftViewBottomBuilder(context).putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
                    if (clickLeftBottom != null) {
                      clickLeftBottom(context);
                    }
                  },
                )),
        ),
      ],
    ).putIntoContainer(width: width);
   
  }

  Widget buildRightView(BuildContext context, List itemList) {
    log("执行1");
    
    return CustomScrollView(
      // key: UniqueKey(),
          controller: _rightScrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Stack()
                  .addSubWight(
                      Center(
                        child: Text("放开切换上一个item"),
                      ),
                      left: 0,
                      right: 0,
                      top: 0)
                  .putIntoContainer(height: _rightHeaderPreHeight > changeHeight ? _rightHeaderPreHeight : 0),
            ),
           
            SliverToBoxAdapter(
              child: rightViewHeaderBuilder == null
                  ? Container()
                  : rightViewHeaderBuilder(context).putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
                        if (clickRightHeader != null) {
                          clickRightHeader(context);
                        }
                      },
                    )),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemList == null ? 0 : itemList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildRighItem(context, itemList, index);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: rightViewBottomBuilder == null
                  ? Container()
                  : rightViewBottomBuilder(context).putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
                        if (clickRightBottom != null) {
                          clickRightBottom(context);
                        }
                      },
                    )),
            ),
            SliverToBoxAdapter(
              child: Stack()
                  .addSubWight(
                      Center(
                        child: Text("放开切换下一个item"),
                      ),
                      left: 0,
                      right: 0,
                      top: 0)
                  .putIntoContainer(height: _rightBottomNextHeight > changeHeight ? _rightBottomNextHeight : 0),
            )
          ],
        );
   
  }

  ///创建右边的item
  Widget buildRighItem(BuildContext context, List itemList, int index) {
    log("df");
    Column itemView = Column();
    //item头部
    if (rightItemHeaderBuilder != null) {
      itemView = itemView.addSubWight(
          rightItemHeaderBuilder(context, itemList, index)
             .putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
          if (clickRightItemHeader != null) {
            clickRightItemHeader(context, itemList, index);
          }
        },
      )));
    }
    //item内容
    if (rightItemBuilder != null) {
      itemView = itemView.addSubWight(
          rightItemBuilder(context, itemList, index).putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
          if (clickRightItem != null) {
            clickRightItem(context, itemList, index);
          }
        },
      )));
    }
    //item底部
    if (rightItemBottomBuilder != null) {
      itemView = itemView.addSubWight(
          rightItemBottomBuilder(context, itemList, index)
            .putIntoGestureDetector(GestureDetector(
                    onTapDown:(TapDownDetails details){
          if (clickRightItemBottom != null) {
            clickRightItemBottom(context, itemList, index);
          }
        },
      )));
    }

    return itemView;
  }
}
