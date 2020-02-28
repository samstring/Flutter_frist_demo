import 'package:FlutterDemo/model/course/basemodel.dart';

class UserModel extends BaseModel {
  // String b_Id;
  String userName;
  String userDesc;
  String phoneNumber;
  String password;
  String userToken;
  String avatarImage;
  UserToken bbToken;

  // String avatarImageUrl;
  UserModel({String b_Id,String userName,String phoneNumber,String password,String userToken,String avatarImageUrl,String userDesc,UserToken bbToken}){
    this.b_Id = b_Id;
    this.userName = userName;
    this.phoneNumber = phoneNumber;
    this.password = password;
    this.userToken = userToken;
    this.avatarImage = avatarImageUrl;
    this.userDesc = userDesc;
    this.bbToken = bbToken;
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      b_Id:json['b_Id'],
      userName:json['name'],
      phoneNumber:json['phoneNumber'],
      password:json['password'],
      userToken:json['userToken'],
      avatarImageUrl:json['avatarImage'],
      userDesc:json['userDesc'],
      bbToken: UserToken.fromJson(json['bbToken'])
    );
  }
}

class UserToken extends BaseModel{
  String b_tokenString;
  String chat_tokenString;

  UserToken({String b_tokenString,String chat_tokenString}){
    this.b_tokenString = b_tokenString;
    this.chat_tokenString = chat_tokenString;
  }

  factory UserToken.fromJson(Map<String, dynamic> json){
    return UserToken(
       b_tokenString:json['b_tokenString'],
       chat_tokenString:json['chat_tokenString'],
    );
  }
}