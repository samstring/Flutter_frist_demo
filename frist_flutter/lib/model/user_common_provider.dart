import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'usermodel.dart';

class LoadingViewProvide with ChangeNotifier {
  bool isShowLoading = false;
  setLoadingState(bool isShow) {
    isShowLoading = isShow;
    // log("1111");
    notifyListeners();
  }
}

class LoginInfoProvide with ChangeNotifier {
   UserModel user = UserModel();
   bool isLogin;

   
  setPhoneNumber(String phone){
     user.phoneNumber = phone;
    notifyListeners();
  }


  setPass(String password){
    user.password = password;
    notifyListeners();
  }

  
}

class UserInfoProvider with ChangeNotifier{
  UserModel user = UserModel();
   bool isLogin;

  setLoginStatus(bool isLogin){
     this.isLogin = isLogin;
     notifyListeners();
   }

  setUserInfo(UserModel userModel){
    this.user = userModel;
    notifyListeners();
  }

}
