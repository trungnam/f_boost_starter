

import 'package:flutter_app_boost_new/config/Env.dart';
import 'package:flutter_app_boost_new/model/APIProvider.dart';
import 'package:flutter_app_boost_new/model/repository/advice_repository.dart';
import 'package:flutter_app_boost_new/utility/framework/Application.dart';
import 'package:logging/logging.dart';

import '../utility/log/Log.dart';

class MainDartApplication extends Application{
  AppRepository apiRepository;

  static final MainDartApplication _singleton = MainDartApplication._internal();

  factory MainDartApplication() {
    return _singleton;
  }

  MainDartApplication._internal();

  @override
  Future<void> onCreate() async {
    _initLog();
    _initAPIRepository();
  }

  @override
  void onTerminate() {
    // TODO: implement onTerminate
  }

  void _initLog(){
    Log.init();

    switch(Env.value.environmentType){
      case EnvType.TESTING:
      case EnvType.DEVELOPMENT:
      case EnvType.STAGING:{
        Log.setLevel(Level.ALL);
        break;
      }
      case EnvType.PRODUCTION:{
        Log.setLevel(Level.INFO);
        break;
      }
    }
  }
  void _initAPIRepository(){
    APIProvider apiProvider = APIProvider();
    apiRepository = AppRepository(apiProvider);
  }


}