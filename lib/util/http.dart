/*
***网络请求封装
***
*/
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:hk_app/data/authoriz.dart';
import 'package:hk_app/data/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
// 设置请求头
var httpHeaders = {
  'Accept': '*/*',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept-Language': 'zh-CN,zh;q=0.9',
  'Connection': 'keep-alive',
  'Host': 'gold-tag-ms.juejin.im',
  'Origin': 'https://juejin.im',
  'Referer': 'https://juejin.im/timeline',
  'User-Agent':
      'Mozilla/5.0 (iPhone; CPU iPhone OS 11_0 like Mac OS X) AppleWebKit/604.1.38 (KHTML, like Gecko) Version/11.0 Mobile/15A372 Safari/604.1',
  'X-Juejin-Client': '1531286592293',
  'X-Juejin-Src': 'web',
  'X-Juejin-Token': 'eyJhY2Nlc3NfdG9rZW4iOiJuU2ZVQ05tVlZ6VlNUUUNtIiwicmVmcmVzaF90b2tlbiI6ImVSUE52RTN1ODlwZVZ1TXYiLCJ0b2tlbl90eXBlIjoibWFjIiwiZXhwaXJlX2luIjoyNTkyMDAwfQ==',
  'X-Juejin-Uid': '59120a711b69e6006865dd7b',
};
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
var baseUrl= "",memberToken = '',prvComany='';
dynamic roleid;
// Get请求
// Authoriz请求
Future authorizRequest(dataParam) async{
  Dio dio = new Dio();
  //Fiddler抓包设置代理
  /*(dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
    client.findProxy = (url){
      return "PROXY 172.31.61.75:8888";
    };
    //抓Https包设置
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };*/
  var content;
  try {
    Response response = await dio.post(url,data:dataParam);
    content = response.data.toString();
  }
  catch (e){
    print(e);
  }
  return new Future((){
     Map<String, dynamic> json = jsonDecode(content);
     var data = AuthrizData.fromJson(json);
     if (data.status.code == 0){
       baseUrl = data.data.httpPort;
       roleid = data.data.roleID;
     }
    return data;
  });
  
}


// 登录请求
Future ajaxRequest(dataParam,url) async{
  Dio dio = new Dio();
  //Fiddler抓包设置代理
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
    client.findProxy = (url){
      return "PROXY 172.31.61.75:8888";
    };
    //抓Https包设置
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
  };
   SharedPreferences.getInstance()
     ..then((prefs) {
        Map<String, dynamic> userinfo = json.decode(prefs.getString("userInfo"));
       if(userinfo !=null){
         memberToken = Autogenerated.fromJson(userinfo).data.memberToken;
         prvComany =Autogenerated.fromJson(userinfo).data.companyID;
        }
     });
  dio.options.headers = {
        "X-HKMobile-ApiKey" :  memberToken,
				"RoleId" : roleid,
				"PrvCompany" : prvComany
  };
  var content;
  var response = await dio.post(baseUrl+url ,data:dataParam);
  content = response.toString();
  return new Future.delayed(Duration(milliseconds: 200 ),() async{
     Map<String, dynamic> json = jsonDecode(content);
     var data = Autogenerated.fromJson(json);
     if (data.code == 1){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("userInfo", content);
        loginJuejin(); // 登录获取掘金信息
     }
    return data;
  });
}


Future getArticle({int limit= 20,String category,dynamic before = ""}) async{
   Dio dio = new Dio();
    
    //Fiddler抓包设置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.findProxy = (url){
        return "PROXY 172.31.61.75:8888";
      };
      //抓Https包设置
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    dio.options.headers = {
       "X-Agent": "Juejin/Web"
    };
    final String url =
        'https://timeline-merger-ms.juejin.im/v1/get_entry_by_rank?&src=web&before=${before}&limit=20&category=${category}';
    final response = await dio.get(url);
    return new Future((){
      return response.toString();
      }
    );
  
 
}
Future getCategories() async {
   Dio dio = new Dio();
    //Fiddler抓包设置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.findProxy = (url){
        return "PROXY 172.31.61.75:8888";
      };
      //抓Https包设置
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    dio.options.headers = httpHeaders;
    final response = await dio.get('https://gold-tag-ms.juejin.im/v1/categories');
     return new Future((){
       return response.toString();
     });
  }
  //flutter packages pub run build_runner build
  // 登录掘金
  Future loginJuejin() async {
    Dio dio = new Dio();
    //Fiddler抓包设置代理
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client){
      client.findProxy = (url){
        return "PROXY 172.31.61.75:8888";
      };
      //抓Https包设置
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
     dio.options.headers = {
       "X-Agent": "Juejin/Web"
     };
    final response = await dio.post('https://juejin.im/auth/type/phoneNumber',data:  {'phoneNumber': 13308195914,
        			'password': 'lbq771777725',});
    Map<String, dynamic> json = jsonDecode(response.toString());
    httpHeaders['X-Juejin-Token'] = json['token'];
    httpHeaders['X-Juejin-Uid'] = json['userId'];
    //device_id
    httpHeaders['X-Juejin-Client'] = json['clientId'].toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("juejinInfo", json['user'].toString());
   
    //return response.toString();
  }