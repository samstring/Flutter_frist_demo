import 'package:FlutterDemo/model/course/basemodel.dart';
import 'package:FlutterDemo/model/usermodel.dart';


import 'package:json_annotation/json_annotation.dart'; 
  
part 'coursemodel.g.dart';


@JsonSerializable()
  class CourseModel extends Object with _$CourseModelSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'b_user_Id')
    String bUserId;
  
  
    @JsonKey(name: 'clickTime')
    int clickTime;
  
    @JsonKey(name: 'coverImageUrl')
    String coverImageUrl;
  
    @JsonKey(name: 'dateCreated')
    String dateCreated;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'hateCount')
    int hateCount;
  
    @JsonKey(name: 'likeCount')
    int likeCount;
  
    @JsonKey(name: 'title')
    String title;
  
    @JsonKey(name: 'version')
    int version;
  
    @JsonKey(name: 'videoImages')
    List<VideoImages> videoImages;
  
    @JsonKey(name: 'videoInfo')
    String videoInfo;
  
    @JsonKey(name: 'videoTime')
    int videoTime;
  
    @JsonKey(name: 'videoType')
    int videoType;
  
    @JsonKey(name: 'videoUrlAdress')
    String videoUrlAdress;
  
    CourseModel(this.bId,this.bUserId,this.clickTime,this.coverImageUrl,this.dateCreated,this.deleted,this.hateCount,this.likeCount,this.title,this.version,this.videoImages,this.videoInfo,this.videoTime,this.videoType,this.videoUrlAdress,);
  
  
    factory CourseModel.fromJson(Map<String, dynamic> srcJson) => _$CourseModelFromJson(srcJson);
  
  }


 

  
@JsonSerializable()
  class VideoImages extends Object with _$VideoImagesSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'imageUrl')
    String imageUrl;
  
    @JsonKey(name: 'user_Id')
    String userId;
  
    @JsonKey(name: 'version')
    int version;
  
    VideoImages(this.bId,this.deleted,this.imageUrl,this.userId,this.version,);
  
    factory VideoImages.fromJson(Map<String, dynamic> srcJson) => _$VideoImagesFromJson(srcJson);
  
  }
  
  

 mixin _$CourseModelSerializerMixin {
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
}

mixin _$VideoImagesSerializerMixin {
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
}
  