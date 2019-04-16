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
  Http(){
    print("dio赋值");
    // 传递一个options来创建dio实例
    options1 = Options(
      baseUrl: "http://hksalestar.pousheng.com:8400/api/v1/Authoriz/Auth",
      connectTimeout: 10000,
      receiveTimeout: 3000,
      headers: {}
    );
    dio = new Dio(options1);
  }
  get(url, {data, options, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      var future = dio.get(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      response = await future;
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }
  post(url, {data, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}