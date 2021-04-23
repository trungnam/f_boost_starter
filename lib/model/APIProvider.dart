

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_boost_new/model/response/AdviceResponse.dart';
import 'package:flutter_app_boost_new/utility/http/HttpException.dart';
import '../utility/log/DioLogger.dart';

class APIProvider{
  static const String TAG = 'APIProvider';

  static const String _baseUrl = 'https://api.adviceslip.com/advice';
  static const String _TOP_FREE_APP_API = '/rss/topfreeapplications/limit=%d/json';
  static const String _TOP_FEATURE_APP_API = '/rss/topgrossingapplications/limit=%d/json';
  static const String _APP_DETAIL_API = '/lookup/json';

  Dio _dio;

  APIProvider(){
    BaseOptions dioOptions = BaseOptions()
      ..baseUrl = APIProvider._baseUrl;

    _dio = Dio(dioOptions);
    // _dio.interceptors.add(InterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     DioLogger.onSend(TAG, options);
    //     return options;
    //   },
    //   onResponse: (e, handler) {
    //     DioLogger.onSuccess(TAG, e);
    //     return e;
    //   },
    //   onError: (e, handler) {
    //     DioLogger.onError(TAG, e);
    //     return ;
    //   },
    // ));

    // if(EnvType.DEVELOPMENT == Env.value.environmentType || EnvType.STAGING == Env.value.environmentType){
    //
    //
    // }
  }

  // Future<TopAppResponse> getTopFreeApp(int limit) async{
  //   Response response = await _dio.get(sprintf(APIProvider._TOP_FREE_APP_API, [limit]));
  //   throwIfNoSuccess(response);
  //   return TopAppResponse.fromJson(jsonDecode(response.data));
  // }
  //
  // Future<TopAppResponse> getTopFeatureApp(int limit) async{
  //   Response response = await _dio.get(sprintf(APIProvider._TOP_FEATURE_APP_API, [limit]));
  //   throwIfNoSuccess(response);
  //   return TopAppResponse.fromJson(jsonDecode(response.data));
  // }
  //
  // Future<LookupResponse> getAppDetail(String id) async{
  //   Response response = await _dio.get(APIProvider._APP_DETAIL_API, queryParameters:{'id':id});
  //   throwIfNoSuccess(response);
  //   return LookupResponse.fromJson(jsonDecode(response.data));
  // }
  //
  void throwIfNoSuccess(Response response) {
    if(response.statusCode < 200 || response.statusCode > 299) {
      throw new HttpException(response);
    }
  }

    Future<AdviceResponse> getTopFreeApp() async{
      Response response = await _dio.get('');
      // var response = await Dio().get('http://www.google.com');
      print("$response");
      // throwIfNoSuccess(response);
      return AdviceResponse.fromJSON(jsonDecode(response.data));
    }

  // void getHTTP() async {
  //   try {
  //     Response response = await _dio.get("");
  //     // Do whatever
  //     print("$response");
  //   } on DioError catch (e) {
  //     // Do whatever
  //     // log("$response");
  //     // log("apiProvider ");
  //     print("$e");
  //   }
  // }


}