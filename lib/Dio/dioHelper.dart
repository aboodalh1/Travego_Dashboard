import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../shared/component/component.dart';

class DioHelper {
  static late Dio dio;
  Map <String ,dynamic> headers = {
    'Accept': 'application/json',
    'lang': 'en',
    'Authorization': 'Bearer '
  };
  static init()
  {
    dio = Dio(BaseOptions(
      baseUrl: 'https://travego-z86d.onrender.com/api/',
      receiveDataWhenStatusError: true,
      // connectTimeout: Duration(seconds: 5 ),
      //   receiveTimeout : Duration(seconds: 3)
    ));
  }
  static Future<Response> getData(
      {required String path,
        Map<String, dynamic> ?query,
        String? token}) async
  {
    dio.options.headers =
    {
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
    return await dio.get(
      path,
      queryParameters: query??null,
    ).catchError((e){
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }


    });
  }
  static Future<Response> deleteData(
      {required String path,
        Map<String, dynamic> ?query,
        String? token}) async
  {
    dio.options.headers =
    {
      'Accept': 'application/json',
      'Authorization':'Bearer $token'
    };
    return await dio.delete(
      path,
      queryParameters: query??null,
      data: query
    ).catchError((e){
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }


    });
  }

  static Future<Response> postData(
      {
        required String url,
        required Map<String, dynamic> data,
        }) async
  {
      dio.options.headers = {
      'Accept': 'application/json',
    };

    return dio.post(
        url,
        data: data,).catchError((e){
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        showToast(text: e.toString(), state: ToastStates.ERROR);
        print(e.message);
      }


    });


  }



  static Future postDataWithAuth(
      {
        required String url,
        required Map<String, String> data,
        String? token}) async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://127.0.0.1:8000/api/$url',
      data: FormData.fromMap(data),
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    ).catchError((e){
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }


    });

    if (response.statusCode == 200) {
      return response.data ;
    }
    else {
      return response.statusMessage;
    }
  }





  static Future postDataWithAuth1(
      {
        required String url,
        required Map<dynamic,List<Map<dynamic,dynamic>>> data,
        String? token}) async
  {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token}'
    };
    var dio = Dio();
    var response = await dio.request(
      'http://127.0.0.1:8000/api/$url',

      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: json.encode(data),
    ).catchError((e){
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }


    });

    if (response.statusCode == 200) {
      return response.data ;
    }
    else {
      return response.statusMessage;
    }
  }


  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String lang="en",
        String? token}) async
  {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ??''
    };
    return dio.put(
        url,
        queryParameters: query,
        data: data);
  }



  static Future<http.Response> login({
    required String email,
    required String password
  })async{
    Uri url = Uri.parse('http://127.0.0.1:8000/api/login');
    return http.post(url,body: {
      'phone':'$email',
      'password': '$password',
    },
);

  }
  static Future logout({required String token})async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 23|iHkIF2Z4oI1OVIoxcDNodjo85mbZNcwCjpujq3qbbd04b900'
    };

    var response = await dio.request(
      'http://127.0.0.1:8000/api/logout',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    );

  }
}