import 'dart:developer';
import 'dart:io';

import 'package:FlutterDemo/view/chat/chat_input_bar.dart';
import 'package:FlutterDemo/view/chat/chat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sfviewtool/sfviewtool.dart';

import 'chat_input_tooview.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatPage();
  }
}

class _ChatPage extends State<ChatPage> {

  String chatId;
  List<ChatMessage> chatMessageList = List();

  // bool isShowKeyBoard = false;
  // bool isShowbottomTool = false;
  bool isFristIn = true;
  double bottomToolViewHeight = 0;
  double keyBoarHeight = 0;

  bool isJumpToLast;

  ScrollController chatContentScrollController = ScrollController();

  NotificationListener chatContent;
  double chatContentOffSet = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      // if(chatContentOffSet != chatContentScrollController.position.maxScrollExtent){

      // }

      //键盘高度：大于零，键盘弹出，否则，键盘隐藏
      if (MediaQuery.of(context).viewInsets.bottom > 0) {
        // chatContentScrollController.jumpTo(chatContentScrollController.position.maxScrollExtent);
        // isShowKeyBoard = true;
        if (keyBoarHeight != MediaQuery.of(context).viewInsets.bottom) {
          setState(() {
            keyBoarHeight = MediaQuery.of(context).viewInsets.bottom;
            bottomToolViewHeight = 0;
          });
        }
      } else {
        if (keyBoarHeight != 0) {
          setState(() {
            keyBoarHeight = 0;
          });
        }
      }

      if (keyBoarHeight != 0 || bottomToolViewHeight != 0 || isFristIn || isJumpToLast == true) {
        chatContentScrollController
            .jumpTo(chatContentScrollController.position.maxScrollExtent);
        isFristIn = false;
        isJumpToLast = false;
      }
    });
    chatContent = getChatContent(chatContentScrollController);

    double bottomHeight = 0;
    if (keyBoarHeight != 0) {
      bottomHeight = keyBoarHeight;
    } else {
      if (bottomToolViewHeight != 0) {
        bottomHeight = bottomToolViewHeight;
      }
    }
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("聊天"),
        ),
        body: Container(
          child: Stack()
              .addSubWight(
                  Flex(
                    direction: Axis.vertical,
                  ).addSubWight(chatContent, flex: 1).addSubWight(
                      getBottomInput().putIntoContainer(
                          constraints:
                              BoxConstraints(maxHeight: 100, minHeight: 44),
                          width: double.infinity)),
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: bottomHeight)
              .addSubWight(
                  DefalutChatInputToolView(bottomToolViewHeight, 7, (index) {
                    return Stack()
                        .addSubWight(Image(
                            image: AssetImage("assets/images/ITquanxian.png"),
                            fit: BoxFit.contain))
                        .addSubWight(
                            Center(
                              child: Text("title" + index.toString()),
                            ).putIntoContainer(height: 20),
                            left: 0,
                            right: 0,
                            bottom: 0)
                        .putIntoContainer(
                            padding: EdgeInsets.all(5), color: Colors.red)
                        .putIntoGestureDetector(
                            GestureDetector(
                              // behavior: HitTestBehavior.opaque,
                              onTapDown: (event) {
                      chooseImage();
                    }
                    ));
                  }),
                  left: 0,
                  right: 0,
                  bottom: 0)
              .putInfoSaveArea(),
        ));
  }

  ///聊天内容视图
  Widget getChatContent(ScrollController controller) {
    CustomScrollView content = CustomScrollView(
      controller: controller,
      slivers: this.chatMessageList.map((message){
          return SliverToBoxAdapter(child: ChatItem(chatMessage: message,),);
        }).toList(),
    );

    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          chatContentOffSet = notification.metrics.pixels;
        },
        child: content.putIntoGestureDetector(GestureDetector(
          onTapDown: (event) {
            closeKeyBoard();
            showBottomToolViewHeight(0);
          },
          onVerticalDragDown: (event) {
            closeKeyBoard();
            showBottomToolViewHeight(0);
          },
        )));
  }

  //底部输入框视图
  Widget getBottomInput() {
    DefalutChatInput defalutChatInput = DefalutChatInput();
    defalutChatInput.setMoreButtonBlock(() {
      showBottomToolViewHeight(240);
    });
    defalutChatInput.setSendButtonBlock((content){
      sendTextMessage(content);
    });
    return defalutChatInput;
  }

  //底部工具栏视图
  Widget getBottomToolView() {
    return Container(
      height: bottomToolViewHeight,
      // color: Colors.red,
      width: double.infinity,
    );
  }

  ///关闭键盘
  closeKeyBoard() {
    FocusScope.of(context).requestFocus(FocusNode());
    keyBoarHeight = 0;
    // isShowKeyBoard = false;
  }

  showBottomToolViewHeight(double height) {
    closeKeyBoard();
    setState(() {
      bottomToolViewHeight = height;
    });
  }


  sendTextMessage(content){
     ChatMessage chatMessage = ChatMessage();
     chatMessage.messageSourceType = MessageSourceType.send;
     chatMessage.messageType = MessageType.text;
     chatMessage.content = content;
     setState(() {
       chatMessageList.add(chatMessage);
       bottomToolViewHeight = 0;
        isJumpToLast = true;
     closeKeyBoard();
     });
     
  }

  chooseImage() async {
    log("选择照片");
     var imageFile =  ImagePicker.pickImage(source: ImageSource.gallery);
     ChatMessage chatMessage = ChatMessage();
     chatMessage.messageSourceType = MessageSourceType.send;
     chatMessage.messageType = MessageType.image;
     chatMessage.content = imageFile;


    
     setState(() {
       chatMessageList.add(chatMessage);
       bottomToolViewHeight = 0;
        isJumpToLast = true;
     closeKeyBoard();
     });
  }

  openCamera() async{
    await ImagePicker.pickImage(source: ImageSource.camera);
  }
}
