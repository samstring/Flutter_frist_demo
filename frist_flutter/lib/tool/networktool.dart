
import 'dart:developer';

import 'package:dio/dio.dart';

const String serverAdress = "http://47.105.188.234:8080/FlutterDemo_war";

class NetWorkTool  {
  static Dio dio;
  NetWorkCallback netWorkCallback;

// NetWorkTool(NetWorkCallback netWorkCallback){
// this.netWorkCallback = netWorkCallback;
// }

  static Dio getDio(){
    if (dio == null) {
      dio = Dio();

    }
    return dio;
  }

  void post(String url,Map<String,String> params) async {
    try {
        Response response = await NetWorkTool.getDio().post(url,queryParameters: params);
        this.netWorkCallback(response,null);  
    } catch (e) {
      Exception error = Exception(e.toString());
      log(e.toString());
this.netWorkCallback(null,error);
    }

    
  }


void postData(String url,var data) async {
    try {
        Response response = await NetWorkTool.getDio().post(url,data: data,);
        this.netWorkCallback(response,null);  
    } catch (e) {
      Exception error = Exception(e.toString());
      
this.netWorkCallback(null,error);
    }

    
  }
  
}

// typedef netWordResopne = void netWorKResopneBlock(int index);
typedef NetWorkCallback = void Function(Response response,Exception error);