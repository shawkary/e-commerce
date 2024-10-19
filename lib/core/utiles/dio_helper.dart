import 'package:dio/dio.dart';



class DioHelper
{
  DioHelper(this._dio);
  final Dio _dio;

  final _baseUrl = 'https://student.valuxapps.com/api/';

  Future<Response> postData({
    required String endPoint,
    query,
    required Map<String, dynamic> data,
    String lang = 'en',
    token,
  })async {
    _dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await _dio.post('$_baseUrl$endPoint', queryParameters: query, data: data);
  }

  Future<Response> putData({
    required String endPoint,
    query,
    required Map<String, dynamic> data,
    String lang = 'en',
    token,
  })async {
    _dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };
    return await _dio.put('$_baseUrl$endPoint', queryParameters: query, data: data);
  }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
    String lang = 'en',
    token,
  })async {
    _dio.options.headers = {
      'lang': lang,
      'Content-Type':'application/json',
      'Authorization': token,
    };
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}