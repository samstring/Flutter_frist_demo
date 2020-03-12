// import 'package:FlutterDemo/model/course/basemodel.dart';

import 'package:json_annotation/json_annotation.dart'; 
  
part 'usermodel.g.dart';


@JsonSerializable()
  class UserModel extends Object with _$UserModelSerializerMixin{
  
    @JsonKey(name: 'avatarImage')
    String avatarImage;
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'bangId')
    String bangId;
  
    @JsonKey(name: 'bbToken')
    BbToken bbToken;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'fansCount')
    int fansCount;
  
    @JsonKey(name: 'followCount')
    int followCount;
  
    @JsonKey(name: 'likeCount')
    int likeCount;
  
    @JsonKey(name: 'login')
    bool login;
  
    @JsonKey(name: 'name')
    String name;
  
    @JsonKey(name: 'phoneNumber')
    String phoneNumber;
  
    @JsonKey(name: 'userDesc')
    String userDesc;
  
    @JsonKey(name: 'videoCount')
    int videoCount;
  
    String password;
  
    UserModel({this.avatarImage,this.bId,this.bangId,this.bbToken,this.deleted,this.fansCount,this.followCount,this.likeCount,this.login,this.name,this.phoneNumber,this.userDesc,this.videoCount,});
  
    factory UserModel.fromJson(Map<String, dynamic> srcJson) => _$UserModelFromJson(srcJson);
  
  }
  
  mixin _$UserModelSerializerMixin {
     UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    avatarImage:json['avatarImage'] as String,
    bId:json['b_Id'] as String,
    bangId:json['bangId'] as String,
    bbToken:json['bbToken'] == null
        ? null
        : BbToken.fromJson(json['bbToken'] as Map<String, dynamic>),
    deleted:json['deleted'] as bool,
    fansCount:json['fansCount'] as int,
    followCount:json['followCount'] as int,
    likeCount:json['likeCount'] as int,
    login:json['login'] as bool,
    name:json['name'] as String,
    phoneNumber:json['phoneNumber'] as String,
    userDesc:json['userDesc'] as String,
    videoCount:json['videoCount'] as int,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatarImage': instance.avatarImage,
      'b_Id': instance.bId,
      'bangId': instance.bangId,
      'bbToken': instance.bbToken,
      'deleted': instance.deleted,
      'fansCount': instance.fansCount,
      'followCount': instance.followCount,
      'likeCount': instance.likeCount,
      'login': instance.login,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'userDesc': instance.userDesc,
      'videoCount': instance.videoCount,
    };
}

  
@JsonSerializable()
  class BbToken extends Object with _$BbTokenSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'b_tokenString')
    String bTokenString;
  
    @JsonKey(name: 'b_uploadString')
    String bUploadString;
  
    @JsonKey(name: 'chat_tokenString')
    String chatTokenString;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'version')
    int version;
  
    BbToken({this.bId,this.bTokenString,this.bUploadString,this.chatTokenString,this.deleted,this.version,});
  
    factory BbToken.fromJson(Map<String, dynamic> srcJson) => _$BbTokenFromJson(srcJson);
  
  }
  
  mixin _$BbTokenSerializerMixin {
   

    BbToken _$BbTokenFromJson(Map<String, dynamic> json) {
  return BbToken(
    
    bId:json['b_Id'] as String,
    bTokenString:json['b_tokenString'] as String,
    bUploadString:json['b_uploadString'] as String,
    chatTokenString:json['chat_tokenString'] as String,
    deleted:json['deleted'] as bool,
    version:json['version'] as int,
  );
}

Map<String, dynamic> _$BbTokenToJson(BbToken instance) => <String, dynamic>{
      'b_Id': instance.bId,
      'b_tokenString': instance.bTokenString,
      'b_uploadString': instance.bUploadString,
      'chat_tokenString': instance.chatTokenString,
      'deleted': instance.deleted,
      'version': instance.version,
    };
}

  


// class UserModel extends BaseModel {
//   // String b_Id;
//   String userName;
//   String userDesc;
//   String phoneNumber;
//   String password;
//   String userToken;
//   String avatarImage;
//   UserToken bbToken;

//   // String avatarImageUrl;
//   UserModel({String b_Id,String userName,String phoneNumber,String password,String userToken,String avatarImageUrl,String userDesc,UserToken bbToken}){
//     this.b_Id = b_Id;
//     this.userName = userName;
//     this.phoneNumber = phoneNumber;
//     this.password = password;
//     this.userToken = userToken;
//     this.avatarImage = avatarImageUrl;
//     this.userDesc = userDesc;
//     this.bbToken = bbToken;
//   }

//   factory UserModel.fromJson(Map<String, dynamic> json){
//     return UserModel(
//       b_Id:json['b_Id'],
//       userName:json['name'],
//       phoneNumber:json['phoneNumber'],
//       password:json['password'],
//       userToken:json['userToken'],
//       avatarImageUrl:json['avatarImage'],
//       userDesc:json['userDesc'],
//       bbToken: UserToken.fromJson(json['bbToken'])
//     );
//   }
// }

// class UserToken extends BaseModel{
//   String b_tokenString;
//   String chat_tokenString;

//   UserToken({String b_tokenString,String chat_tokenString}){
//     this.b_tokenString = b_tokenString;
//     this.chat_tokenString = chat_tokenString;
//   }

//   factory UserToken.fromJson(Map<String, dynamic> json){
//     return UserToken(
//        b_tokenString:json['b_tokenString'],
//        chat_tokenString:json['chat_tokenString'],
//     );
//   }
// }