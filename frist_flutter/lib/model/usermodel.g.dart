// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
