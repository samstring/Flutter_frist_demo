import 'package:flutter/material.dart';

extension PaddingViewTool on Widget{

Container putIntoContainer({
  	//复制Container构造函数的所有参数（除了child字段）
    Key key,
    AlignmentGeometry alignment,
    EdgeInsetsGeometry padding,
    Color color,
    Decoration decoration,
    Decoration foregroundDecoration,
    double width,
    double height,
    BoxConstraints constraints,
    EdgeInsetsGeometry margin,
    Matrix4 transform,
  }) {
  	//调用Container的构造函数，并将当前widget对象作为child参数
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints,
      margin: margin,
      transform: transform,
      child: this,
    );
  }

  SafeArea putInfoSaveArea({
    Key key,
    bool left,
    bool right,
    bool top,
    bool bottom,
    EdgeInsets minimum,
    bool maintainBottomViewPadding,
  }){
    return SafeArea(
    key:key,
    left: left == null ? true:left,
    top:top  == null ? true:top,
    right:right  == null ? true:right,
    bottom:bottom  == null ? true:bottom,
    minimum:minimum  == null ? EdgeInsets.zero:minimum,
    maintainBottomViewPadding: maintainBottomViewPadding == null ? true:maintainBottomViewPadding,
    child: this,
    );
  }

}