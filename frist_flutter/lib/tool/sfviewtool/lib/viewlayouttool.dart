import 'package:flutter/material.dart';

//stack
extension StackViewTool on Stack {
  Stack addSubWight(Widget widget,
      {double top, double left, double bottom, double right}) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);

    if (top != null || left != null || right != null || top != null) {
      Widget postionWidet = Positioned(
        child: widget,
        top: top,
        left: left,
        bottom: bottom,
        right: right,
      );
      
      list.add(Container(child: postionWidet,));
    } else {
      list.add(widget);
    }

    return Stack(
      key: this.key,
      alignment: this.alignment,
      fit: this.fit,
      overflow: this.overflow,
      children: list,
    );
  }
}

//Flex
extension FlexViewTool on Flex {
  Flex addSubWight(Widget widget, {bool isShowInExpandWidget, int flex}) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);

    if ((isShowInExpandWidget !=null && isShowInExpandWidget) || flex != null) {
      Widget subWidget = Expanded(
        flex: flex,
        child: widget,
      );
      list.add(subWidget);
    } else {
      list.add(widget);
    }

    return Flex(
      mainAxisAlignment: this.mainAxisAlignment,
      mainAxisSize: this.mainAxisSize,
      crossAxisAlignment: this.crossAxisAlignment,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      textBaseline: this.textBaseline,
      direction: this.direction,
      children: list,
    );
  }
}

//Wrap
extension WrapViewTool on Wrap {
  Wrap addSubWight(Widget widget) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);

    list.add(widget);

    return Wrap(
      key: this.key,
      direction: this.direction,
      alignment: this.alignment,
      spacing: this.spacing,
      runAlignment: this.runAlignment,
      runSpacing: this.runSpacing,
      crossAxisAlignment: this.crossAxisAlignment,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      children: list,
    );
  }
}

//Flow
extension FolwViewTool on Flow {
  Flow addSubWight(Widget widget) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);

    list.add(widget);

    return Flow(
      key: this.key,
      delegate: this.delegate,
      children: list,
    );
  }
}

//Row
extension RowViewTool on Row {
  Row addSubWight(Widget widget) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);

    list.add(widget);

    return Row(
      key: this.key,
      mainAxisAlignment: this.mainAxisAlignment,
      mainAxisSize: this.mainAxisSize,
      crossAxisAlignment: this.crossAxisAlignment,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      textBaseline: this.textBaseline,
      children: list,
    );
  }
}

extension ColumnViewTool on Column {
  Column addSubWight(Widget widget) {
    List<Widget> oldWigetList = this.children;
    List<Widget> list = List();
    list.addAll(oldWigetList);
    list.add(widget);

    return Column(
      key: this.key,
      mainAxisAlignment: this.mainAxisAlignment,
      mainAxisSize: this.mainAxisSize,
      crossAxisAlignment: this.crossAxisAlignment,
      textDirection: this.textDirection,
      verticalDirection: this.verticalDirection,
      textBaseline: this.textBaseline,
      children: list,
    );
  }
}


