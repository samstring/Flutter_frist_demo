 import 'package:flutter/material.dart';

const String serverAdress = "http://47.105.188.234:8080/FlutterDemo_war/";
// const String serverAdress = "http://192.168.1.11:8080/FlutterDemo_war/";


final login_url = serverAdress+"user_login.action";
 final updateUserAvatar = serverAdress+"user_updateUserAvatar.action";
 final updateUserInfo_url = serverAdress+"user_updateSingleUserInfo.action";

 //分类
 final category_home_url = serverAdress+"category_getHomeCategoryList.action";

//  视频
final hotVideo_url = serverAdress+ "video_getHotList.action";
final recomendVideo_url = serverAdress+ "video_getRecomentVideoList.action";

final video_detail_info = serverAdress + "video_getVideoInfoById.action";

final like_video_url = serverAdress + "likeVideo_likeVideo.action";
final unLike_video_url = serverAdress + "likeVideo_unLikeVideo.action";

final banner_url = serverAdress+ "video_getBannerList.action";
final search_url = serverAdress+ "video_searchVideoList.action";
final searchword_url = serverAdress+ "video_getHotSearchWord.action";