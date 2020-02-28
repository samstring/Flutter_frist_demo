import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfviewtool/sfviewtool.dart';


typedef ClickChatInputToolButtonBlock = void  Function();
typedef ClickSendButtonBlock = void  Function(String content);



class DefalutChatInput extends StatefulWidget {

_DefalutChatInput _defalutChatInput = _DefalutChatInput();

setMoreButtonBlock(ClickChatInputToolButtonBlock clickChatInputToolButtonBlock){
  _defalutChatInput.clickChatInputToolButtonBlock = clickChatInputToolButtonBlock;
  
}

setSendButtonBlock(ClickSendButtonBlock clickSendButtonBlock){
_defalutChatInput.clickSendButtonBlock = clickSendButtonBlock;
}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _defalutChatInput;
  }
}

//输入类型
enum InputType {
  keyBoard, //文本输入
  voice, //1为语音输入
}

class _DefalutChatInput extends State<DefalutChatInput> {
  InputType inputType = InputType.keyBoard;
  Widget voiceInputButton;
  int voiceInputButtonState = 0;//0是未触按，1是按下，2是按着，3是松开
  Widget textInputTextfield;

  ClickChatInputToolButtonBlock clickChatInputToolButtonBlock;
  ClickSendButtonBlock clickSendButtonBlock;

  initView(BuildContext context) {
    textInputTextfield = CupertinoTextField(
      maxLines: null,
      textInputAction: TextInputAction.send,
      onSubmitted:(content){
        if (clickSendButtonBlock != null) {
          clickSendButtonBlock(content);
        }
      },
      
    );

    String voiceInputButtonTip = "按住说话";
    if (voiceInputButtonState == 1) {
      voiceInputButtonTip = "松开发送";
    }else{
      voiceInputButtonTip = "按住说话";
    }
    voiceInputButton = Center(child: Text(voiceInputButtonTip),).putIntoContainer(height:40,decoration: BoxDecoration(
      color: Colors.transparent,border: Border.all(color: Colors.black12,width: 1)
    ))
    
    .putIntoGestureDetector(GestureDetector(
      onLongPressStart: (event){
        log("开始按");
        setState(() {
          voiceInputButtonState =1;
        });
      },
       onLongPressEnd: (event){
        log("按着");
          setState(() {
          voiceInputButtonState =2;
        });

      },
       onLongPressUp: (){
          setState(() {
          voiceInputButtonState =3;
        });

        log("松开");
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    initView(context);

    // TODO: implement build
    return Scaffold(
      body: Flex(
      direction: Axis.horizontal,
    )
        .addSubWight(IconButton(
          icon: Icon(
            (inputType == InputType.voice ? Icons.keyboard : Icons.voice_chat),
            size: 24,
          ),
          onPressed: () {
            setState(() {
              if (inputType == InputType.keyBoard) {
                inputType = InputType.voice;
              } else {
                inputType = InputType.keyBoard;
              }
            });
            //  setKeyBoardHeight(100);
          },
        ))
        .addSubWight(
            InputType.keyBoard == inputType
                ? textInputTextfield
                : voiceInputButton,
            flex: 1)
        .addSubWight(IconButton(
          icon: Icon(
            Icons.add,
            size: 24,
          ),
          onPressed: () {
            if(clickChatInputToolButtonBlock != null){
              clickChatInputToolButtonBlock();
            }
          },
        )),
    );
  }
}


