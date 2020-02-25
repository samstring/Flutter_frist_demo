import 'dart:developer';

import 'package:FlutterDemo/model/course/coursecategorymodel.dart';
import 'package:FlutterDemo/view/course/categorydetail.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';
import 'package:flutter/rendering.dart';

final double leftRowHeight = 40;
final double subItemTitleHeight = 40;
final double subItemHeight = 30;
final double itemSpace= 30;


class CategoryView extends StatefulWidget {
  double _leftWidth;
  List<CategoryLeftItemModel> _titles;
  List<CategoryRightModel> _subItems;
  

  CategoryView(double leftWidth,List<CategoryLeftItemModel> titles,List<CategoryRightModel> subItems) {
    _leftWidth = leftWidth == null ? 50 : leftWidth;
    _titles = titles;
    _subItems = subItems;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryView(_leftWidth,_titles,_subItems);
  }
}

class _CategoryView extends State<CategoryView> {
  double _leftWidth;
  int _selectIndex;
  List<CategoryLeftItemModel> _titles;
  List<CategoryRightModel> _subItems;
  // List<CategoryRightModel> _models;
  
  CategoryRight categoryRight;

  void _onLeftSelect(int newValue) {
    setState(() {
      _selectIndex = newValue;
    });

    
  }



  _CategoryView(double leftWidth,List<CategoryLeftItemModel> titles,List<CategoryRightModel> subItems) {
    _leftWidth = leftWidth == null ? 50 : leftWidth;
    _titles = titles;
    _subItems = subItems;
  }

  @override
  Widget build(BuildContext context) {
    ValueChanged<int> onLeftChaged = (int selectedIndex) {
      _onLeftSelect(selectedIndex);
    };

     
    // TODO: implement build
    
    categoryRight = CategoryRight(_subItems);
    return Row(
    )
        .addSubWight(CategoryLeft(_titles, onLeftChaged, _selectIndex)
            .putIntoContainer(width: _leftWidth))
        .addSubWight(categoryRight.putIntoContainer(
            width: MediaQuery.of(context).size.width - _leftWidth)).putIntoContainer(height: MediaQuery.of(context).size.height);
    // return Row(
    //   children: <Widget>[
    //     Flexible(
    //       child:
    //     )
    //   ],
    // )
  }
}

class _onRightSelect {
}

class CategoryLeft extends StatelessWidget {
  List<CategoryLeftItemModel> _titles;
  final ValueChanged<int> onChaged;
  int _selectedIndx;

  CategoryLeft(List<CategoryLeftItemModel> titles, this.onChaged, int selectIndex) {
    _titles = titles;
    _selectedIndx = selectIndex == null ? 0 : selectIndex;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> subWigets = List();

    for (var i = 0; i < _titles.length; i++) {
      Color rowColor = Colors.black12;
      if (i == _selectedIndx) {
        rowColor = Colors.white;
      }
      subWigets.add(Text(
        _titles[i].title,
        textScaleFactor: 1.2,
      )
          .putIntoContainer(
              color: rowColor,
              width: MediaQuery.of(context).size.width,
              height: leftRowHeight,
              alignment: Alignment.center)
          .putIntoGestureDetector(GestureDetector(
        onTapDown: (event) {
          this.onChaged(i);
        },
      )));
    }

    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: subWigets,
    )).putIntoContainer(height: double.infinity, color: Colors.black12);
  }
}

class CategoryRight extends StatelessWidget {
  List<CategoryRightModel> _items;
  List<double> _itemHeights = List();
  int _selectedIndex = 0;
  List<Widget> subWigets = List();

  ScrollController _scrollController = ScrollController(
    keepScrollOffset: true
  );

  CategoryRight(List<CategoryRightModel> items) {
    _items = items;
  }

  @override
  Widget build(BuildContext context) {
    

    for (var i = 0; i < _items.length; i++) {
      Wrap subItemsView =
          Wrap(spacing: 8.0, runSpacing: 10.0, alignment: WrapAlignment.start);

      for (var t = 0; t < _items[i].subItems.length; t++) {
        subItemsView = subItemsView.addSubWight(FlatButton(
          // key: ValueKey(value)
          child: Text(_items[i].subItems[t].title),
          onPressed: () {
            //  log(_items[i].subItems[t].title);
            Navigator.push(context, MaterialPageRoute(builder: (context){
            return CourseCategoryDetaiPage(_items[i],i);
            }));
          },
        ).putIntoContainer(
        height: subItemHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),border: Border.fromBorderSide(BorderSide(width:1,color: Colors.grey))),
        ));
      }

      Column item = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_items[i].titleModel.title)
                .putIntoContainer(height: 30, alignment: Alignment.centerLeft).putIntoContainer(height: subItemTitleHeight),
            subItemsView,
          ]);
          
      Container itemContainer = item.putIntoContainer(key: key,padding: EdgeInsets.only(bottom: itemSpace, left: 20,right: 20));
      subWigets.add(itemContainer);
      double rowsCount = _items[i].subItems.length/3+_items[i].subItems.length%3;
      double itemHeight = subItemTitleHeight+itemSpace+rowsCount*(subItemHeight+10);
      this._itemHeights.add(itemHeight);
    }
    
   
   return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double offSet = notification.metrics.pixels;
         
        },
        child: SingleChildScrollView(
      child: Column(
        children: subWigets,
      ),
      // children: subWigets,
      controller: _scrollController,
    
    ).putIntoContainer(height: double.infinity),
    );

  }
}

class HeightReporter extends StatelessWidget {
  final Widget child;

  HeightReporter({this.child});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: child,
      onTap: () {
        print('Height is ${context.size.height}');
      },
    );
  }
}

