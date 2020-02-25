import 'dart:developer';
import 'dart:io';

import 'package:FlutterDemo/view/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfviewtool/sfviewtool.dart';

class ChatItem extends StatefulWidget {
  // final MessageSourceType messageSourceType;
  // final MessageType messageType;
  final ChatMessage chatMessage;

  ChatItem(
      {Key key,  this.chatMessage})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatItem(this.chatMessage);
  }
}

class _ChatItem extends State<ChatItem> {
   MessageSourceType _messageSourceType;
   MessageType _messageType;
  final ChatMessage _chatMessage;

  

  _ChatItem(this._chatMessage){
    _messageSourceType = _chatMessage.messageSourceType;
    _messageType = _chatMessage.messageType;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    Widget avatar = Image.network(
      "https://avatar.csdnimg.cn/2/7/5/3_qq_36071410.jpg",
      width: 50,
      height: 50,
    )
        .putIntoContainer(width: 50, height: 50,decoration: BoxDecoration(shape: BoxShape.circle))
        .putIntoGestureDetector(GestureDetector());
    Widget tag = Container(
      width: 20,
      height: 10,
      color: Colors.transparent,
    );

    Widget content;
    content = Container(
      height: 150,
      color: Colors.red,
      child: Container(
        width: 100,
        color: Colors.red,
        height: 150,
      ),
    );


   if (_chatMessage.messageType == MessageType.image) {
     log("---这里没错");
     content = _previewImage(_chatMessage.content);
    // content = Image.file(_chatMessage.content, fit: BoxFit.cover);
   }

   if (_chatMessage.messageType == MessageType.text) {
     log("---这里没错");
    content = Text(_chatMessage.content).putIntoContainer(
      color: Colors.greenAccent,
      padding: EdgeInsets.all(10),
      
    );
   }

   


    Widget chatItem = LayoutBuilder(
      builder: (context, constrait) {
        
        if (_messageSourceType == MessageSourceType.recive) {
          Widget chatWidget = Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
          )
              .addSubWight(avatar)
              .addSubWight(tag)
              .addSubWight(content, isShowInExpandWidget: true, flex: 1)
              .putIntoContainer(
                  margin: EdgeInsets.only(
                      left: 10, top: 10, right: constrait.maxWidth / 10 * 2));
          return chatWidget;
        } else if (_messageSourceType == MessageSourceType.send) {
          Widget chatWidget = Flex(
            direction: Axis.horizontal,
            
            crossAxisAlignment: CrossAxisAlignment.start,
          )
              .addSubWight(Wrap(children: <Widget>[content],alignment: WrapAlignment.end,), isShowInExpandWidget: true, flex: 1)
              .addSubWight(tag)
              .addSubWight(avatar)
              .putIntoContainer(
                  // width: constrait.maxWidth/10 * 8,
                  margin: EdgeInsets.only(
                left: constrait.maxWidth / 10 * 2,
                right: 10,
                top: 10,
              ));
          return chatWidget;
        } else {
          return Container();
        }
      },
    );
    return chatItem;
  }

  Widget _previewImage(imageFile) {
    log(imageFile.toString());
    return FutureBuilder<File>(
        future: imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return SizedBox(
                child: Image.file(snapshot.data, fit: BoxFit.cover)
              );
          
          } else {
           
            return Container();
          }
        });
  }
}

enum MessageType {
  //消息类型
  text, //文字
  image, //图片
  video, //视频
  audio, //语音
  customer, //自定义
}

enum MessageSourceType {
  //消息种类
  recive, //接收
  send, //发送
  system, //系统消息
  customer, //自定义
}

class MessagePersonalInfo {
  String name;
  String avatar;
  var data;
}

class ChatMessage {
  MessageSourceType messageSourceType; //0是发出去，1是接收消息
  MessageType messageType; //消息类型
  var content;

  MessagePersonalInfo sendInfo;
  MessagePersonalInfo recevierInfo;
}
