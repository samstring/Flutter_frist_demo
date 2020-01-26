class UserModel {
  String userId;
  String userName;
  String userDesc;
  String phone;
  String password;
  String userToken;
  String avatarImageUrl;

  // String avatarImageUrl;
  UserModel({String userId,String userName,String phone,String password,String userToken,String avatarImageUrl,String userDesc}){
    this.userId = userId;
    this.userName = userName;
    this.phone = phone;
    this.password = password;
    this.userToken = userToken;
    this.avatarImageUrl = avatarImageUrl;
    this.userDesc = userDesc;
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      userId:json['userId'],
      userName:json['name'],
      phone:json['phoneNumber'],
      password:json['password'],
      userToken:json['userToken'],
      avatarImageUrl:json['avatarImageUrl'],
      userDesc:json['userDesc']
    );
  }
}