import 'package:dio/dio.dart';
import 'package:flutter_app_boost_new/utility/log/Log.dart';

class DioLogger{
  static void onSend(String tag, RequestOptions options){
    print('$tag - Request Path : [${options.method}] ${options.baseUrl}${options.path}');
    print('$tag - Request Data : ${options.data.toString()}');
  }

  static void onSuccess(String tag, Response response){
    // Log.info('$tag - Response Path : [${response.request.method}] ${response.request.baseUrl}${response.request.path} Request Data : ${response.request.data.toString()}');
    print('$tag - Response statusCode : ${response.statusCode}');
    print('$tag - Response data : ${response.data.toString()}');
  }

  static void onError(String tag, DioError error){
    if(null != error.response){
      // Log.info('$tag - Error Path : [${error.response.request.method}] ${error.response.request.baseUrl}${error.response.request.path} Request Data : ${error.response.request.data.toString()}');
      print('$tag - Error statusCode : ${error.response.statusCode}');
      print('$tag - Error data : ${null != error.response.data ? error.response.data.toString() : ''}');

    }
    // Log.info('$tag - Error Message : ${error.message}');
    print('$tag - Error Message : ${error.message}');
  }
}