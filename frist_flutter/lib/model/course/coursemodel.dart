import 'package:FlutterDemo/model/course/basemodel.dart';
import 'package:FlutterDemo/model/usermodel.dart';

class CourseModel extends BaseModel{
  String imageUrl;
  String courseTitle;
  String courseDesc;//课程描述
  List<String> courseDescImageList;
  String courseFor;//适用人群
  int favouriteCount;//收藏人数

  UserModel teacherMode;//教师
  List<CourseContentModel> contentModels;


}

class CourseContentModel  extends BaseModel{
  String title;
  List<CourseContentItemModel> itemModels;

}

class CourseContentItemModel  extends BaseModel{
  String title;
  String videoUrl;

}