class CategoryRightModel {
  CategoryRightTitleModel titleModel;
  List<CategoryRightItemModel> subItems;

  CategoryRightModel(CategoryRightTitleModel titleModel, List<CategoryRightItemModel> subItems) {
    this.titleModel = titleModel;
    this.subItems = subItems;
  }
  CategoryRightTitleModel getTitle() {
    return titleModel;
  }

  List<CategoryRightItemModel> getSubItem() {
    return subItems;
  }
}

class CategoryLeftItemModel{
  String i_Id;
  String title;

CategoryLeftItemModel(String i_Id,String title){
  this.i_Id = i_Id;
  this.title = title;
}
}

class CategoryRightTitleModel{
  String i_Id;
  String title;

CategoryRightTitleModel( String i_Id,String title){
  this.i_Id = i_Id;
  this.title = title;
}
}

class CategoryRightItemModel{
  String i_Id;
  String title;

CategoryRightItemModel( String i_Id,String title){
  this.i_Id = i_Id;
  this.title = title;
}
}