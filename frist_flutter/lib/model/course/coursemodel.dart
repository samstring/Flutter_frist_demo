import 'package:FlutterDemo/model/course/basemodel.dart';
import 'package:FlutterDemo/model/usermodel.dart';

class CourseModel extends BaseModel{
  String coverImageUrl;
  String title;
  String videoInfo;//课程描述
  String videoUrlAdress;
  List<String> courseDescImageList;
  String courseFor;//适用人群
  int favouriteCount;//收藏人数

  UserModel teacherMode;//教师
  List<CourseContentModel> contentModels;

  CourseModel({b_Id,this.coverImageUrl,this.title,this.videoInfo,this.videoUrlAdress}){
    this.b_Id = b_Id;
  }

  factory CourseModel.fromJson(Map<String, dynamic> json){
    return CourseModel(
      b_Id: json['b_Id'],
      coverImageUrl:json['coverImageUrl'],
      title:json['title'],
      videoInfo:json['videoInfo'],
      videoUrlAdress:json['videoUrlAdress'],
      
    );
  }


}

class CourseContentModel  extends BaseModel{
  String title;
  List<CourseContentItemModel> itemModels;

}

class CourseContentItemModel  extends BaseModel{
  String title;
  String videoUrl;

}