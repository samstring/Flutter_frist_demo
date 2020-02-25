import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';

const double LeftWidth = 60;
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
  final LeftViewHeaderBuilder leftViewHeaderBuilder;
  final LeftViewBottomBuilder leftViewBottomBuilder;
  final LeftItemBuilder leftItemBuilder;

  final RightViewHeaderBuilder rightViewHeaderBuilder;
  final RightViewBottomBuilder rightViewBottomBuilder;
  final RightItemBuilder rightItemBuilder;
  final RightItemHeaderBuilder rightItemHeaderBuilder;
  final RightItemBottomBuilder rightItemBottomBuilder;

  final ClickLeftItem clickLeftItem;
  final ClickRightItem clickRightItem;
  final ClickRightItemHeader clickRightItemHeader;
  final ClickRightItemBottom clickRightItemBottom;

  final ClickLeftHeader clickLeftHeader;
  final ClickLeftBottom clickLeftBottom;
  final ClickRightHeader clickRightHeader;
  final ClickRightBottom clickRightBottom;

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
    _categoryViewTool.rightViewList = rightViewList;
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
  final LeftViewHeaderBuilder leftViewHeaderBuilder;
  final LeftViewBottomBuilder leftViewBottomBuilder;
  final LeftItemBuilder leftItemBuilder;

  final RightViewHeaderBuilder rightViewHeaderBuilder;
  final RightViewBottomBuilder rightViewBottomBuilder;
  final RightItemBuilder rightItemBuilder;
  final RightItemHeaderBuilder rightItemHeaderBuilder;
  final RightItemBottomBuilder rightItemBottomBuilder;

  final ClickLeftItem clickLeftItem;
  final ClickRightItem clickRightItem;
  final ClickRightItemHeader clickRightItemHeader;
  final ClickRightItemBottom clickRightItemBottom;

  final ClickLeftHeader clickLeftHeader;
  final ClickLeftBottom clickLeftBottom;
  final ClickRightHeader clickRightHeader;
  final ClickRightBottom clickRightBottom;

   List leftViewList;
   List rightViewList;
  final double leftViewWidth;

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
                        log("dfdf");
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
    log("执行"+itemList.toString());
    // return NotificationListener<ScrollNotification>(
    //     // 添加 NotificationListener 作为父容器
    //     onNotification: (scrollNotification) {
    //       if(rightContentHeiht == 0){
    //            rightContentHeiht =   scrollNotification.metrics.maxScrollExtent;
    //           }
              
    //       log(scrollNotification.metrics.pixels.toString()+"----"+context.size.height.toString()+"---"+_rightScrollController.position.maxScrollExtent.toString());
    //       // log("==="+_rightScrollController.position.minScrollExtent.toString());
          
    //       // 注册通知回调
    //       if (scrollNotification is ScrollStartNotification) {
    //         // 滚动开始
    //       }
    //        else if (scrollNotification is ScrollUpdateNotification) {
    //         if (scrollNotification.metrics.pixels < 0) {
    //           // if (scrollNotification.metrics.pixels < -changeHeight){
    //              setState(() {
    //                log("下拉"+_rightHeaderPreHeight.toString());
    //             _rightHeaderPreHeight = -scrollNotification.metrics.pixels;
    //           });
    //           // }
             
    //           if (scrollNotification.metrics.pixels < -changeHeight){
    //             _changeState = ChangeState.chageStatePre;
    //           }

    //         // }
            
              
    //         }
    //         else if(scrollNotification.metrics.pixels > context.size.height){
              
    //            setState(() {
    //             _rightBottomNextHeight = scrollNotification.metrics.pixels - rightContentHeiht;
    //           });
    //           // }
             
    //           if (scrollNotification.metrics.pixels > rightContentHeiht+changeHeight){
    //             _changeState = ChangeState.chagetStateNext;
    //           }
    //         }
    //          else {
               
    //           setState(() {
    //             if(_rightHeaderPreHeight > 0.0){
    //               _rightHeaderPreHeight  = _rightHeaderPreHeight -1;
    //             }
    //             if(_rightHeaderPreHeight <= 0.0){
    //               _rightHeaderPreHeight = 0;
    //             }
                
    //             _rightBottomNextHeight = 0;
    //             // _changeState = ChangeState.chageStateNormal;
    //           });
    //         }
    //         // 滚动位置更新
    //       } else if (scrollNotification is ScrollEndNotification) {
    //         //滚动结束后改变index
    //         if (_changeState == ChangeState.chageStatePre) {
    //           setState(() {
    //             selectIndex = selectIndex - 1 < 0 ? 0 : selectIndex - 1;
    //             _changeState = ChangeState.chageStateNormal;
    //           });
    //         }
    //          if (_changeState == ChangeState.chagetStateNext) {
    //            setState(() {
    //             //  log("dfdf234");
    //            rightContentHeiht = 0;
    //            _rightBottomNextHeight = 0;
    //            if(selectIndex + 1 <= itemList.length-1){
              
    //             selectIndex = selectIndex + 1 ;
              
    //            }
    //            });
              
    //         }

    //       }
    //     },
    //     child: CustomScrollView(
    //       controller: _rightScrollController,
    //       physics: const AlwaysScrollableScrollPhysics(),
    //       scrollDirection: Axis.vertical,
    //       slivers: <Widget>[
    //         SliverToBoxAdapter(
    //           child: Stack()
    //               .addSubWight(
    //                   Center(
    //                     child: Text("放开切换上一个item"),
    //                   ),
    //                   left: 0,
    //                   right: 0,
    //                   top: 0)
    //               .putIntoContainer(height: _rightHeaderPreHeight > changeHeight ? _rightHeaderPreHeight : 0),
    //         ),
           
    //         SliverToBoxAdapter(
    //           child: rightViewHeaderBuilder == null
    //               ? Container()
    //               : rightViewHeaderBuilder(context).putIntoListner(Listener(
    //                   onPointerDown: (event) {
    //                     if (clickRightHeader != null) {
    //                       clickRightHeader(context);
    //                     }
    //                   },
    //                 )),
    //         ),
    //         SliverToBoxAdapter(
    //           child: Container(
    //             child: ListView.builder(
    //               shrinkWrap: true,
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemCount: itemList == null ? 0 : itemList.length,
    //               itemBuilder: (BuildContext context, int index) {
    //                 return buildRighItem(context, itemList, index);
    //               },
    //             ),
    //           ),
    //         ),
    //         SliverToBoxAdapter(
    //           child: rightViewBottomBuilder == null
    //               ? Container()
    //               : rightViewBottomBuilder(context).putIntoListner(Listener(
    //                   onPointerDown: (event) {
    //                     if (clickRightBottom != null) {
    //                       clickRightBottom(context);
    //                     }
    //                   },
    //                 )),
    //         ),
    //         SliverToBoxAdapter(
    //           child: Stack()
    //               .addSubWight(
    //                   Center(
    //                     child: Text("放开切换下一个item"),
    //                   ),
    //                   left: 0,
    //                   right: 0,
    //                   top: 0)
    //               .putIntoContainer(height: _rightBottomNextHeight > changeHeight ? _rightBottomNextHeight : 0),
    //         )
    //       ],
    //     ));


    return CustomScrollView(
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
