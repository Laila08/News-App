import 'package:dio/dio.dart';

class DioHelper{
  static  Dio? dio;
  static init(){
    dio =  Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }
  static Future<Response> getData({required String path_url, required Map<String,dynamic> query,})async{
    return await dio!.get(path_url,queryParameters: query);
  }
}