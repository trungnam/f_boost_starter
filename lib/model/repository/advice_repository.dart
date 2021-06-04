
import 'package:flutter_app_boost_new/model/APIProvider.dart';
import 'package:flutter_app_boost_new/model/response/AdviceResponse.dart';
import 'package:rxdart/rxdart.dart';


class AppRepository {
  APIProvider _apiProvider;

  AppRepository(this._apiProvider);

  Stream<SearchAdviceResponse> getAdviceList(String keyword){
    return Stream.fromFuture(_apiProvider.getSearchAdvice(keyword))
        .throttleTime(Duration(seconds: 2));
  }
  
}
