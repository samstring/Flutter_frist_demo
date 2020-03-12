// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coursemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return CourseModel(
    json['b_Id'] as String,
    json['b_user_Id'] as String,
    json['clickTime'] as int,
    json['coverImageUrl'] as String,
    json['dateCreated'] as String,
    json['deleted'] as bool,
    json['hateCount'] as int,
    json['likeCount'] as int,
    json['title'] as String,
    json['version'] as int,
    (json['videoImages'] as List)
        ?.map((e) =>
            e == null ? null : VideoImages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['videoInfo'] as String,
    json['videoTime'] as int,
    json['videoType'] as int,
    json['videoUrlAdress'] as String,
  );
}

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'b_user_Id': instance.bUserId,
      'clickTime': instance.clickTime,
      'coverImageUrl': instance.coverImageUrl,
      'dateCreated': instance.dateCreated,
      'deleted': instance.deleted,
      'hateCount': instance.hateCount,
      'likeCount': instance.likeCount,
      'title': instance.title,
      'version': instance.version,
      'videoImages': instance.videoImages,
      'videoInfo': instance.videoInfo,
      'videoTime': instance.videoTime,
      'videoType': instance.videoType,
      'videoUrlAdress': instance.videoUrlAdress,
    };

VideoImages _$VideoImagesFromJson(Map<String, dynamic> json) {
  return VideoImages(
    json['b_Id'] as String,
    json['deleted'] as bool,
    json['imageUrl'] as String,
    json['user_Id'] as String,
    json['version'] as int,
  );
}

Map<String, dynamic> _$VideoImagesToJson(VideoImages instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'deleted': instance.deleted,
      'imageUrl': instance.imageUrl,
      'user_Id': instance.userId,
      'version': instance.version,
    };
