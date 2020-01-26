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

  setPhoneNumber(String phone){
     user.phone = phone;
    notifyListeners();
  }


  setPass(String password){
    user.password = password;
    notifyListeners();
  }
}
