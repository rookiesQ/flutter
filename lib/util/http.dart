/*
***网络请求封装
***
*/
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';

void httpClient() async {
  var responseBody;
  var httpClient = new HttpClient();
  var request = await httpClient.getUrl(Uri.parse("http://www.wanandroid.com/project/list/1/json?cid=1"));
  var response = await request.close();
  if (response.statusCode == 200){
        responseBody = await response.transform(Utf8Decoder()).join();
        //print(responseBody);
  }
  httpClient.close();
}

// 授权地址
const url = 'http://edi01.ysappstore.com:8012/api/v1/Authoriz/Auth';
var url_base = "";

// Get请求
Future getRequest()  async{
  var content;
  Dio dio = new Dio();
  var response = await dio.get(url);
  content = response.data.toString();
  return new Future((){
    return content;
  });
}

// Post请求
void postRequest(url_post,dataParam) async{
  Dio dio = new Dio();
  var content;
  var response = await dio.post(url_post,data:dataParam);
  content = response.data.toString();
}


// Authoriz请求
Future authorizRequest(dataParam) async{
  Dio dio = new Dio();
  /*dataParam = {
    'body':dataParam
  };*/
  
  var content;
  try {
    Response response = await dio.post(url,data:dataParam);
    content = response.data.toString();
    print(content);
  }
  catch (e){
    print(e);
  }
  return new Future((){
     Map<String, dynamic> json = jsonDecode(content);
    return json;
  });
  
}


// Authoriz请求
Future ajaxRequest(dataParam) async{
  Dio dio = new Dio();
  var content;
  var response = await dio.post(url_base ,data:dataParam);
  content = response.data.toString();
  return new Future((){
    return content;
  });
}