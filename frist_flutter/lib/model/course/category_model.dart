import 'package:json_annotation/json_annotation.dart'; 
  
part 'category_model.g.dart';


@JsonSerializable()
  class VideoCategoryModel extends Object with _$VideoCategoryModelSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'name')
    String name;
  
    @JsonKey(name: 'version')
    int version;
  
    @JsonKey(name: 'videoCategoryBannerItemModels')
    List<VideoCategoryBannerItemModels> videoCategoryBannerItemModels;
  
    @JsonKey(name: 'videoCategroySectionModels')
    List<VideoCategroySectionModels> videoCategroySectionModels;
  
    VideoCategoryModel(this.bId,this.deleted,this.name,this.version,this.videoCategoryBannerItemModels,this.videoCategroySectionModels,);
  
    factory VideoCategoryModel.fromJson(Map<String, dynamic> srcJson) => _$VideoCategoryModelFromJson(srcJson);
  
  }
  
  mixin _$VideoCategoryModelSerializerMixin {
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
}

  
@JsonSerializable()
  class VideoCategoryBannerItemModels extends Object with _$VideoCategoryBannerItemModelsSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'imageUrl')
    String imageUrl;
  
    @JsonKey(name: 'title')
    String title;
  
    @JsonKey(name: 'version')
    int version;
  
    VideoCategoryBannerItemModels(this.bId,this.deleted,this.imageUrl,this.title,this.version,);
  
    factory VideoCategoryBannerItemModels.fromJson(Map<String, dynamic> srcJson) => _$VideoCategoryBannerItemModelsFromJson(srcJson);
  
  }
  
  mixin _$VideoCategoryBannerItemModelsSerializerMixin {
}

  
@JsonSerializable()
  class VideoCategroySectionModels extends Object with _$VideoCategroySectionModelsSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'name')
    String name;
  
    @JsonKey(name: 'version')
    int version;
  
    @JsonKey(name: 'videoCategoryItemModels')
    List<VideoCategoryItemModels> videoCategoryItemModels;
  
    VideoCategroySectionModels(this.bId,this.deleted,this.name,this.version,this.videoCategoryItemModels,);
  
    factory VideoCategroySectionModels.fromJson(Map<String, dynamic> srcJson) => _$VideoCategroySectionModelsFromJson(srcJson);
  
  }
  
  mixin _$VideoCategroySectionModelsSerializerMixin {
}

  
@JsonSerializable()
  class VideoCategoryItemModels extends Object with _$VideoCategoryItemModelsSerializerMixin{
  
    @JsonKey(name: 'b_Id')
    String bId;
  
    @JsonKey(name: 'deleted')
    bool deleted;
  
    @JsonKey(name: 'imageUrl')
    String imageUrl;
  
    @JsonKey(name: 'title')
    String title;
  
    @JsonKey(name: 'version')
    int version;
  
    VideoCategoryItemModels(this.bId,this.deleted,this.imageUrl,this.title,this.version,);
  
    factory VideoCategoryItemModels.fromJson(Map<String, dynamic> srcJson) => _$VideoCategoryItemModelsFromJson(srcJson);
  
  }
  
  mixin _$VideoCategoryItemModelsSerializerMixin {
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
}

  

// class VideoCategoryModel {
//   final String name;
//   final List<VideoCategroySectionModel> videoCategroySectionModels ;
//   final List<VideoCategoryItemModel> videoCategoryBannerItemModels;

//   VideoCategoryModel({this.name, this.videoCategroySectionModels, this.videoCategoryBannerItemModels});

//    factory VideoCategoryModel.fromJson(Map<String, dynamic> json){

//     //  List videoCategoryBannerModelsJsons = json['videoCategoryBannerItemModels'];
//      List  videoCategoryBannerModels = new List();
//     //  for (var i = 0; i < videoCategoryBannerModelsJsons.length; i++) {
//     //    VideoCategoryItemModel model = VideoCategoryItemModel.fromJson(videoCategoryBannerModelsJsons[i]);
//     //    videoCategoryBannerModels.add(model);
//     //  }

//     //  List videoCategorySectionModelsJsons = json['videoCategroySectionModels'];
//     //  List  videoCategorySectionModels = new List();
//     //  for (var i = 0; i < videoCategorySectionModelsJsons.length; i++) {
//     //    VideoCategoryItemModel model = VideoCategoryItemModel.fromJson(videoCategorySectionModelsJsons[i]);
//     //    videoCategorySectionModels.add(model);
//     //  }

//      return VideoCategoryModel(
//        name:json["name"], videoCategroySectionModels:List(), videoCategoryBannerItemModels:videoCategoryBannerModels);
//    }
// }

// class VideoCategroySectionModel {
//   final String name;
//  final List<VideoCategoryItemModel> videoCategoryItemModels ;

//   VideoCategroySectionModel({this.name, this.videoCategoryItemModels});

//    factory VideoCategroySectionModel.fromJson(Map<String, dynamic> json){
//      List videoCategoryItemModelsJsons = json['videoCategoryItemModels'];
//      List videoCategoryItemModels = new List();
//      for (var i = 0; i < videoCategoryItemModelsJsons.length; i++) {
//        VideoCategoryItemModel model = VideoCategoryItemModel.fromJson(videoCategoryItemModelsJsons[i]);
//        videoCategoryItemModels.add(model);
//      }
//      return VideoCategroySectionModel(name:json['name'],videoCategoryItemModels:videoCategoryItemModels);
//    }
// }

// class VideoCategoryItemModel {
//   final String title;
//   final String imageUrl;

//   VideoCategoryItemModel({this.title, this.imageUrl});

//   factory VideoCategoryItemModel.fromJson(Map<String, dynamic> json){
//      return VideoCategoryItemModel(title:json['title'],imageUrl:json['imageUrl']);
//    }
// }
