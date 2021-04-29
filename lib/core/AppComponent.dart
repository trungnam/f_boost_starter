import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_boost_new/core/MainFApplication.dart';
import 'package:flutter_app_boost_new/main.dart';
import 'package:flutter_app_boost_new/my_boost_app.dart';
import 'package:flutter_app_boost_new/utility/log/Log.dart';

class AppComponent extends StatefulWidget {
  final MainDartApplication _application;

  AppComponent(this._application);

  @override
  State createState() {
    return new AppComponentState(_application);
  }
}

class AppComponentState extends State<AppComponent> {
  final MainDartApplication _application;

  AppComponentState(this._application);

  @override
  void dispose() async {
    Log.info('dispose');
    super.dispose();
    await _application.onTerminate();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // final app = createReduxApp();
    if (kIsWeb) {
      // running on the web!
      return createReduxApp();
    } else {
      // NOT running on the web! You can check for additional platforms here.
      //using flutter boost - start from native app
      return MyBoostApp();
    }
    // return app;
  }
}
