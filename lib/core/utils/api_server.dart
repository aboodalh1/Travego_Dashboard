import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiServer {
  final baseUrl = 'https://travego-z86d.onrender.com/api/';

  final Dio _dio;
  ApiServer(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({"Accept": "*/*"});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    var response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: body,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint,
      @required dynamic body,
      String? token,
      Map<String, String>? headersfromRepo}) async {
    Map<String, String> headers = {};

    headers.addAll({"Accept": "*/*"});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: body,
      options: Options(
        headers: headersfromRepo ?? headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put(
      {required String endPoint,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': "*/*",
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    var response = await _dio.put(
      '$baseUrl$endPoint',
      data: body,
      options: Options(
        headers: headers,
      ),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({
    required String endPoint,
    String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({"Accept": "application/json"});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    var response = await _dio.delete(
      '$baseUrl$endPoint',
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
