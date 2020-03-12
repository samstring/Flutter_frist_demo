import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:FlutterDemo/contanst.dart';
import 'package:FlutterDemo/model/usermodel.dart';
import 'package:FlutterDemo/tool/loading_view.dart';
import 'package:FlutterDemo/tool/networktool.dart';
import 'package:FlutterDemo/view/my/usertool.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_crop/image_crop.dart';
import 'dart:convert' as convert;

class CropImageRoute extends StatefulWidget {

  CropImageRoute(this.image);

  File image; //原始图片路径

  @override
  _CropImageRouteState createState() => new _CropImageRouteState();
}

class _CropImageRouteState extends State<CropImageRoute> {
  double baseLeft; //图片左上角的x坐标
  double baseTop; //图片左上角的y坐标
  double imageWidth; //图片宽度，缩放后会变化
  double imageScale = 1; //图片缩放比例
  Image imageView;
  final cropKey = GlobalKey<CropState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑"),
        actions: <Widget>[
          FlatButton(
            child: Text("保存",style: TextStyle(color: Colors.white,fontSize: 16),),
            onPressed: (){
              _crop(widget.image);
            },
          )
        ],
      ),
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Crop.file(
              widget.image,
              key: cropKey,
              aspectRatio: 1.0,
              alwaysShowGrid: true,
            ),
          ),
         
        ],
      ),
    ));
  }

  Future<void> _crop(File originalFile) async {
    final crop = cropKey.currentState;
    final area = crop.area;
    if (area == null) {
      //裁剪结果为空
      print('裁剪不成功');
    }
    await ImageCrop.requestPermissions().then((value) {
      if (value) {
        ImageCrop.cropImage(
          file: originalFile,
          area: crop.area,
        ).then((value) {
          showDialog(context:context,builder:(BuildContext context){
             return LoadingDialog();
          });
          upload(value);
        }).catchError(() {
          print('裁剪不成功');
        });
      } else {
        upload(originalFile);
      }
    });
  }

  ///上传头像
  void upload(File file) async{
     File compressedFile = await FlutterNativeImage.compressImage(file.path,
    quality: 30, percentage: 30);
    
List<int> imageBytes = await compressedFile.readAsBytes();
MultipartFile uploadFile = await MultipartFile.fromFile(compressedFile.path,filename: "upload.txt");


   String imageString = base64Encode(imageBytes);
UserTool.getUserInfo().then((userModel) {
   NetWorkTool net = NetWorkTool();
   net.netWorkCallback = (Response response,Exception error){

     ScaffoldState _state =
        context.ancestorStateOfType(TypeMatcher<ScaffoldState>());

     String responeString = response.toString();
      Map map = convert.jsonDecode(responeString);
    if (map != null) {
        if (map['resultCode'] == "200") {
          UserModel userModel = UserModel.fromJson(map["result"]);
          UserTool.setUserInfo(context, userModel).then((onValue) {
        
          Navigator.pop(context);
           Navigator.pop(context);
          });
        }
        } else {
          Navigator.pop(context);
          _state.showSnackBar(
            SnackBar(
              content: Text(map['error'].toString()),
            ),
          );
        }
   };
  
  
 
  FormData formData =  FormData.fromMap({
   "user.b_Id":userModel.bId,
     "user.bbToken.b_tokenString":userModel.bbToken.bTokenString,
   "file": uploadFile // MultipartFile.fromFile(compressedFile.path),

});

   net.postData(updateUserAvatar,formData);
    });

   
 
  }
}
