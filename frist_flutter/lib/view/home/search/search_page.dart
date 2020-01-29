import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:FlutterDemo/tool/sfviewtool/lib/sfviewtool.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SearchContentType {
  listType,
  tagType,
  customerType,
}

typedef HotSearchViewBuilder<String> = Widget Function(
    List<String> hotSearchWordList);
typedef SearchHitoryViewBuilder<String> = Widget Function(
    List<String> hotSearchWordList);
    

// typedef ClickItemBlock = void
typedef ClickItemBlock = void Function(
    List<String> itemList, int index, bool isHistory);
typedef ClickCancelBlock = void Function(BuildContext context);

class SearchViewPage extends StatefulWidget {

  String s_key; //搜索的key，如果设置了，且key不一样的话，搜索历史会不一样
  String _placeHolder = "搜索"; //搜索文字
  String _hotSearchTitle = "热门搜索";
  String _historySearchTitle = "最近搜索";
  String _cancelTitle = "取消";
  bool _isShowHitorySearch = true; //是否显示搜索历史
  bool _isShowHistoryItemDeleteAllButton = true; //是否显示搜索历史删除按钮
  bool _isShowHotSearch = true; //是否显示热门搜索
  SearchContentType _hotSearchType = SearchContentType.tagType; //热门搜索显示类型
  SearchContentType _hitoryType = SearchContentType.listType; //搜索历史显示类型
  bool _isShowHistoryToTop = true; //历史搜索是否放在最上面
  int _hitoryRecordCount = 20; //历史记录最大数目
  HotSearchViewBuilder _hotSearchBuilder; //自定义热门搜索内容视图
  SearchHitoryViewBuilder _searchHitoryBuilder; //自定义历史搜索内容视图
  List<String> _hotSearchWordList = List(); //热门搜索列表
  List<String> _searchHistoryList = List(); //历史搜索列表
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ClickItemBlock _clickItemBlock;
  ClickCancelBlock _clickCancelBlock;

  SearchViewPage(
      {String s_key,
      String placeHolder,
      String cancelTitle,
      String hotSearchTitle,
      String historySearchTitle,
      bool isShowHitorySearch,
      bool isShowHistoryItemDeleteAllButton,
      bool isShowHotSearch,
      SearchContentType hotSearchType,
      SearchContentType hitoryType,
      bool isShowHistoryToTop,
      int hitoryRecordCount,
      HotSearchViewBuilder hotSearchBuilder,
      SearchHitoryViewBuilder searchHistoryViewBuilder,
      List<String> hotSearchWordList,
      ClickItemBlock clickItemBlock,
      ClickCancelBlock clickCancelBlock

      }) {
    if (s_key != null) this.s_key = s_key;
    if (placeHolder != null) this._placeHolder = placeHolder;
    if (cancelTitle != null) this._cancelTitle = cancelTitle;
    if (hotSearchTitle != null) this._hotSearchTitle = hotSearchTitle;
    if (historySearchTitle != null)
      this._historySearchTitle = historySearchTitle;
    if (isShowHitorySearch != null)
      this._isShowHitorySearch = isShowHitorySearch;
    if (isShowHistoryItemDeleteAllButton != null)
      this._isShowHistoryItemDeleteAllButton = isShowHistoryItemDeleteAllButton;
    if (hotSearchType != null) this._hotSearchType = hotSearchType;
    if (hitoryType != null) this._hitoryType = hitoryType;
    if (isShowHistoryToTop != null)
      this._isShowHistoryToTop = isShowHistoryToTop;
    if (hitoryRecordCount != null) this._hitoryRecordCount = hitoryRecordCount;
    if (hotSearchBuilder != null) this._hotSearchBuilder = hotSearchBuilder;
    if (searchHistoryViewBuilder != null) this._searchHitoryBuilder = searchHistoryViewBuilder;
    if (hotSearchWordList != null) this._hotSearchWordList = hotSearchWordList;
    if (clickItemBlock != null) this._clickItemBlock = clickItemBlock;
    if (clickCancelBlock != null) this._clickCancelBlock = clickCancelBlock;
  }

  @override
  State<StatefulWidget> createState() {
    return _SearchViewPage(s_key: s_key,placeHolder: _placeHolder,cancelTitle:_cancelTitle,hotSearchTitle:_hotSearchTitle,historySearchTitle:_historySearchTitle,
    isShowHitorySearch:_isShowHitorySearch,isShowHistoryItemDeleteAllButton:_isShowHistoryItemDeleteAllButton,
    hotSearchType:_hotSearchType,hitoryType:_hitoryType,isShowHistoryToTop:_isShowHistoryToTop,hitoryRecordCount:_hitoryRecordCount,
    hotSearchBuilder:_hotSearchBuilder,
    hotSearchWordList:_hotSearchWordList,clickItemBlock:_clickItemBlock
    );
  }
}

class _SearchViewPage extends State<SearchViewPage> {
  String s_key; //搜索的key，如果设置了，且key不一样的话，搜索历史会不一样
  String searchText; //输入框内容
  // Icon _searchIcon; //搜索icon
  String _placeHolder = "搜索"; //搜索文字
  String _cancelTitle = "取消";
  String _hotSearchTitle = "热门搜索";
  String _historySearchTitle = "最近搜索";
  // Widget _loadingWidget; //搜索加载框
  bool _isShowHitorySearch = true; //是否显示搜索历史
  bool _isShowHistoryItemDeleteAllButton = true; //是否显示搜索历史删除按钮
  bool _isShowHotSearch = true; //是否显示热门搜索
  SearchContentType _hotSearchType = SearchContentType.tagType; //热门搜索显示类型
  SearchContentType _hitoryType = SearchContentType.listType; //搜索历史显示类型
  bool _isShowHistoryToTop = true; //历史搜索是否放在最上面
  int _hitoryRecordCount = 20; //历史记录最大数目
  HotSearchViewBuilder _hotSearchBuilder; //自定义热门搜索内容视图
  SearchHitoryViewBuilder _searchHitoryBuilder; //自定义历史搜索内容视图
  List<String> _hotSearchWordList = List(); //热门搜索列表
  List<String> _searchHistoryList = List(); //历史搜索列表
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ClickItemBlock _clickItemBlock;
  ClickCancelBlock _clickCancelBlock;

  _SearchViewPage(
      {String s_key,
      String placeHolder,
      String cancelTitle,
      String hotSearchTitle,
      String historySearchTitle,
      bool isShowHitorySearch,
      bool isShowHistoryItemDeleteAllButton,
      bool isShowHotSearch,
      SearchContentType hotSearchType,
      SearchContentType hitoryType,
      bool isShowHistoryToTop,
      int hitoryRecordCount,
      HotSearchViewBuilder hotSearchBuilder,
      SearchHitoryViewBuilder searchHistoryViewBuilder,
      List<String> hotSearchWordList,
      ClickItemBlock clickItemBlock,
      ClickCancelBlock clickCancelBlock}) {
    if (s_key != null) this.s_key = s_key;
    if (placeHolder != null) this._placeHolder = placeHolder;
    if (cancelTitle != null) this._cancelTitle = cancelTitle;
    if (hotSearchTitle != null) this._hotSearchTitle = hotSearchTitle;
    if (historySearchTitle != null)
      this._historySearchTitle = historySearchTitle;
    if (isShowHitorySearch != null)
      this._isShowHitorySearch = isShowHitorySearch;
    if (isShowHistoryItemDeleteAllButton != null)
      this._isShowHistoryItemDeleteAllButton = isShowHistoryItemDeleteAllButton;
    if (hotSearchType != null) this._hotSearchType = hotSearchType;
    if (hitoryType != null) this._hitoryType = hitoryType;
    if (isShowHistoryToTop != null)
      this._isShowHistoryToTop = isShowHistoryToTop;
    if (hitoryRecordCount != null) this._hitoryRecordCount = hitoryRecordCount;
    if (hotSearchBuilder != null) this._hotSearchBuilder = hotSearchBuilder;
    if (searchHistoryViewBuilder != null) this._searchHitoryBuilder = searchHistoryViewBuilder;
    if (hotSearchWordList != null) this._hotSearchWordList = hotSearchWordList;
    if (clickItemBlock != null) this._clickItemBlock = clickItemBlock;
    if (clickCancelBlock != null) this._clickCancelBlock = clickCancelBlock;
  }

  @override
  Widget build(BuildContext context) {
    getHistory();
    Flex content = Flex(
      direction: Axis.vertical,
    );

    content = content
        .addSubWight(getSearchHeaderView()
            .putIntoContainer(width: double.infinity, height: 44))
        .addSubWight(getSearchContentView(), flex: 1);

    return content.putIntoGeustureDetector(GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    ));
  }

  void setHistory(List<String> historyList) async {
    final SharedPreferences prefs = await _prefs;
    if (s_key == null) s_key = "";

    prefs.setStringList(s_key + "search_history", historyList);
  }

  void getHistory() async {
    final SharedPreferences prefs = await _prefs;
    // _searchHistoryList =
    if (s_key == null) s_key = "";

    _searchHistoryList = prefs.getStringList(s_key + "search_history");

    if (_searchHistoryList == null) {
      _searchHistoryList = List();
    }
    setState(() {});
  }

  //搜索框内容视图
  Widget getSearchHeaderView() {
    Widget searchBar = TextField(
      onSubmitted: (text) {
        log(text);
        if (!_searchHistoryList.contains(text)) {
          _searchHistoryList.insert(0, text);
          if (_searchHistoryList.length > _hitoryRecordCount) {
            _searchHistoryList.removeRange(
                _hitoryRecordCount - 1, _searchHistoryList.length - 1);
          }
          setHistory(_searchHistoryList);
        }

        setState(() {});
      },
      onChanged: (text) {
        searchText = text;
        setState(() {});
      },
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          isDense: false,
          filled: true,
          fillColor: Color.fromRGBO(235, 235, 235, 1),
          contentPadding: EdgeInsets.only(left: 10),
          border: InputBorder.none,
          // icon:Icon(Icons.search),
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: Colors.black26,
          ),
          hintText: _placeHolder,
          alignLabelWithHint: true,
          hintStyle: new TextStyle(fontSize: 14, color: Colors.black45)),
    ).putIntoContainer(
        decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(235, 235, 235, 1), width: 1.0), //灰色的一层边框
          color: Color.fromRGBO(235, 235, 235, 1),
          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        ),
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        margin: EdgeInsets.only(left: 5),
        height: 36);

    return Flex(direction: Axis.horizontal)
        .addSubWight(searchBar, flex: 1)
        .addSubWight(FlatButton(
          child: Text(_cancelTitle),
          onPressed: () {
            if(_clickCancelBlock != null){
              _clickCancelBlock(context);
            }else{
              Navigator.of(context).pop(true);
            }
          },
        ).putIntoContainer(height: 44))
        .putIntoContainer(height: 44, margin: EdgeInsets.only(top: 5))
        .putIntoContainer(height: 44);
  }

  //底部搜索内容（热门搜索和搜索历史）
  Widget getSearchContentView() {
    Widget topView;
    Widget bottomView;

    //判断是否有搜索历史,如果有，则判断搜索历史和热门搜索那个在先
    if (_isShowHistoryToTop != null && _isShowHistoryToTop == true) {
      topView = getSearchHistoryView();
      bottomView = getHotSearchView();
    } else {
      topView = getHotSearchView();
      bottomView = getSearchHistoryView();
    }

    if (topView == null) {
      topView = SliverToBoxAdapter(
        child: Container(),
      );
    }
    if (bottomView == null) {
      bottomView = SliverToBoxAdapter(
        child: Container(),
      );
    }

    return CustomScrollView(
      slivers: <Widget>[
        topView,
        SliverToBoxAdapter(
          child: Container(
            height: 20,
          ),
        ),
        bottomView,
      ],
    ).putIntoContainer(width: double.infinity, height: double.infinity);
  }

  Widget getHotSearchView() {
    if (!_isShowHotSearch || _hotSearchWordList.length == 0) {
      return SliverToBoxAdapter(child: Container());
    }
    return getItemContentView(_hotSearchTitle, _hotSearchWordList, false);
  }

  Widget getSearchHistoryView() {
    if (!_isShowHitorySearch || _searchHistoryList.length == 0) {
      return SliverToBoxAdapter(child: Container());
    }
    return getItemContentView(_historySearchTitle, _searchHistoryList, true);
  }

  Widget getItemContentView(
      String title, List<String> itemList, bool isHistory) {
    Column hotSearchView = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
    if (isHistory &&
        _isShowHistoryItemDeleteAllButton != null &&
        _isShowHistoryItemDeleteAllButton == true) {
      hotSearchView = hotSearchView.addSubWight(Flex(direction: Axis.horizontal)
          .addSubWight(
              Text(title)
                  .putIntoContainer(margin: EdgeInsets.only(bottom: 5, top: 5)),
              flex: 1)
          .addSubWight(IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black45,
              ),
              iconSize: 20,
              onPressed: () {
                _searchHistoryList.clear();
                setHistory(_searchHistoryList);

                setState(() {});
              }))
          .putIntoContainer(height: 50));
    } else {
      //  hotSearchView = hotSearchView.addSubWight(Text(title));
      hotSearchView = hotSearchView.addSubWight(Text(title).putIntoContainer(
          margin: EdgeInsets.only(bottom: 5, top: 5), height: 30));
    }

    Widget contentView;

    if ((isHistory != null &&
            isHistory &&
            _hitoryType == SearchContentType.tagType) ||
        ((isHistory == null || !isHistory) &&
            _hotSearchType == SearchContentType.tagType)) {
      Wrap itemContainerView = Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 5,
      );
      for (var i = 0; i < itemList.length; i++) {
        itemContainerView = itemContainerView.addSubWight(Text(
          itemList[i],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
            .putIntoContainer(
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(244, 244, 244, 1)),
                padding:
                    EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5))
            .putIntoGeustureDetector(GestureDetector(
          onTapDown: (event) {
            log(itemList[i]);
            if (!isHistory) {
              if (!_searchHistoryList.contains(itemList[i])) {
                _searchHistoryList.add(itemList[i]);
                setHistory(_searchHistoryList);
              }

              setState(() {});

              if (this._clickItemBlock != null) {
                this._clickItemBlock(itemList, i, isHistory);
              }
            }
          },
        )));
      }
      contentView = itemContainerView;
      hotSearchView = hotSearchView.addSubWight(contentView);
      return SliverPadding(
        padding: EdgeInsets.only(top: 5, left: 15, right: 5),
        sliver: SliverToBoxAdapter(child: hotSearchView),
      );
    } else if (_hotSearchType == SearchContentType.customerType) {
      return SliverToBoxAdapter(
        child: _hotSearchBuilder(itemList),
      );
    } else {
      contentView = ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          Widget item;
          if (isHistory) {
            item = Column()
                .addSubWight(
                    //带删除按钮
                    Flex(
                  direction: Axis.horizontal,
                )
                        .addSubWight(
                            Text(
                              itemList[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).putIntoContainer(
                                height: 44, padding: EdgeInsets.only(top: 10)),
                            flex: 1)
                        .addSubWight(IconButton(
                          iconSize: 14,
                          icon: Icon(Icons.close, color: Colors.black26),
                          onPressed: () {
                            if (_searchHistoryList.contains(itemList[index])) {
                              _searchHistoryList.remove(itemList[index]);
                              setHistory(_searchHistoryList);
                            }

                            setState(() {});
                          },
                        )))
                .addSubWight(Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(235, 235, 235, 1)));
          } else {
            item = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
                .addSubWight(Text(
                  _hotSearchWordList[index],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).putIntoContainer(
                    height: 40, padding: EdgeInsets.only(top: 10)))
                .addSubWight(Container(
                    width: double.infinity,
                    height: 1,
                    color: Color.fromRGBO(235, 235, 235, 1)));
          }
          // return item;
          return item.putIntoGeustureDetector(GestureDetector(
            onTapDown: (event) {
              if (!_searchHistoryList.contains(itemList[index])) {
                _searchHistoryList.insert(0, itemList[index]);
                setHistory(_searchHistoryList);
              }

              setState(() {});
              if (this._clickItemBlock != null) {
                this._clickItemBlock(itemList, index, isHistory);
              }
            },
          ));
        },
      );

      hotSearchView = hotSearchView.addSubWight(contentView);
      return SliverPadding(
        padding: EdgeInsets.only(top: 5, left: 15, right: 5),
        sliver: SliverToBoxAdapter(child: hotSearchView),
      );
    }
  }
}
