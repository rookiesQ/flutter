/*
***网络请求封装
***
*/
import 'package:dio/dio.dart';
class Http{
  static Http instance;
  Dio dio;
  Options options1;
  static Http getInstance() {
    print("getInstance");
    if (instance == null){
      instance = new Http();
    }
    return instance;
  }
}