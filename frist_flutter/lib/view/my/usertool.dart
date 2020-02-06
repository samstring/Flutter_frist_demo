import 'package:FlutterDemo/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTool{
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  
  static Future<bool> isLogin () async{
    final SharedPreferences prefs = await _prefs;
    if (prefs.get("userId") == null || prefs.get("userId") == false || prefs.getString("userId").isEmpty){
      return false;
    }
    return true;
  }

  static setUserInfo(UserModel model) async{
    final SharedPreferences prefs = await _prefs;
    if(model != null){
      if(model.userId != null && model.userId.isNotEmpty){
        prefs.setString("userId", model.userId);
      }
    }
  }
}