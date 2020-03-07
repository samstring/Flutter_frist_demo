// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoCategoryModel _$VideoCategoryModelFromJson(Map<String, dynamic> json) {
  return VideoCategoryModel(
    json['b_Id'] as String,
    json['deleted'] as bool,
    json['name'] as String,
    json['version'] as int,
    (json['videoCategoryBannerItemModels'] as List)
        ?.map((e) => e == null
            ? null
            : VideoCategoryBannerItemModels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['videoCategroySectionModels'] as List)
        ?.map((e) => e == null
            ? null
            : VideoCategroySectionModels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VideoCategoryModelToJson(VideoCategoryModel instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'deleted': instance.deleted,
      'name': instance.name,
      'version': instance.version,
      'videoCategoryBannerItemModels': instance.videoCategoryBannerItemModels,
      'videoCategroySectionModels': instance.videoCategroySectionModels,
    };

VideoCategoryBannerItemModels _$VideoCategoryBannerItemModelsFromJson(
    Map<String, dynamic> json) {
  return VideoCategoryBannerItemModels(
    json['b_Id'] as String,
    json['deleted'] as bool,
    json['imageUrl'] as String,
    json['title'] as String,
    json['version'] as int,
  );
}

Map<String, dynamic> _$VideoCategoryBannerItemModelsToJson(
        VideoCategoryBannerItemModels instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'deleted': instance.deleted,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'version': instance.version,
    };

VideoCategroySectionModels _$VideoCategroySectionModelsFromJson(
    Map<String, dynamic> json) {
  return VideoCategroySectionModels(
    json['b_Id'] as String,
    json['deleted'] as bool,
    json['name'] as String,
    json['version'] as int,
    (json['videoCategoryItemModels'] as List)
        ?.map((e) => e == null
            ? null
            : VideoCategoryItemModels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VideoCategroySectionModelsToJson(
        VideoCategroySectionModels instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'deleted': instance.deleted,
      'name': instance.name,
      'version': instance.version,
      'videoCategoryItemModels': instance.videoCategoryItemModels,
    };

VideoCategoryItemModels _$VideoCategoryItemModelsFromJson(
    Map<String, dynamic> json) {
  return VideoCategoryItemModels(
    json['b_Id'] as String,
    json['deleted'] as bool,
    json['imageUrl'] as String,
    json['title'] as String,
    json['version'] as int,
  );
}

Map<String, dynamic> _$VideoCategoryItemModelsToJson(
        VideoCategoryItemModels instance) =>
    <String, dynamic>{
      'b_Id': instance.bId,
      'deleted': instance.deleted,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'version': instance.version,
    };
