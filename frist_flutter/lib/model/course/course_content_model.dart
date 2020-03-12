class CourseContentModel{
  String title;
    String  courseFor;
    String videoInfo ;
    String contentModels ;
    String favouriteCount;
    String videoUrlAdress;
    List<String> courseDescImageList = List();
    List<CourseContentItemModel> itemModels;
}

class CourseContentItemModel{
  String title;
  String videoUrl;
}