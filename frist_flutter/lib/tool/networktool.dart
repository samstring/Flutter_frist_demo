
import 'package:dio/dio.dart';



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
      Exception error = Exception("服务器繁忙");
      
this.netWorkCallback(null,error);
    }

    
  }
}

// typedef netWordResopne = void netWorKResopneBlock(int index);
typedef NetWorkCallback = void Function(Response response,Exception error);