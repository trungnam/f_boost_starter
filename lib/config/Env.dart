import 'package:flutter/material.dart';
import 'package:flutter_app_boost_new/core/AppComponent.dart';
import 'package:flutter_app_boost_new/core/MainFApplication.dart';

enum EnvType {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
  TESTING
}

class Env {

  static Env value;

  String appName;
  String baseUrl;
  Color primarySwatch;
  EnvType environmentType = EnvType.DEVELOPMENT;

  // Database Config
  int dbVersion = 1;
  String dbName;


  Env() {
    value = this;
    _init();
  }

  void _init() async{
    WidgetsFlutterBinding.ensureInitialized();

    // if(EnvType.DEVELOPMENT == environmentType || EnvType.STAGING == environmentType){
    //   Stetho.initialize();
    // }

    var application = MainDartApplication();
    await application.onCreate();
    runApp(AppComponent(application));
  }
}