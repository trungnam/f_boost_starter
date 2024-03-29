
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boost_new/case/image_pick.dart';
import 'package:flutter_app_boost_new/case/media_query.dart';
import 'package:flutter_app_boost_new/flutter_page.dart';
import 'package:flutter_app_boost_new/main.dart';
import 'package:flutter_app_boost_new/simple_page_widgets.dart';
import 'package:flutter_app_boost_new/tab/simple_widget.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'package:flutter_boost/flutter_boost_app.dart';

import 'case/flutter_to_flutter_sample.dart';
import 'case/return_data.dart';
import 'case/selection_screen.dart';
import 'case/transparent_widget.dart';
import 'case/willpop.dart';
import 'core/MainFApplication.dart';

class MyBoostApp extends StatefulWidget {

  @override
  _MyBoostAppState createState() => _MyBoostAppState();
}

class _MyBoostAppState extends State<MyBoostApp> {


  _MyBoostAppState();

  Map<String, FlutterBoostRouteFactory> routerMap = {
    '/': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => Container());
    },
    'embedded': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => EmbeddedFirstRouteWidget());
    },
    'presentFlutterPage': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => FlutterRouteWidget(
            params: settings.arguments,
            uniqueId: uniqueId,
          ));
    },
    'imagepick': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) =>
              ImagePickerPage(title: "imagepick", uniqueId: uniqueId));
    },
    'firstFirst': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => FirstFirstRouteWidget());
    },
    'willPop': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => WillPopRoute());
    },
    'returnData': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => ReturnDataWidget());
    },
    'transparentWidget': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => TransparentWidget());
    },
    'selectionScreen': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => SelectionScreen());
    },
    'secondStateful': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SecondStatefulRouteWidget());
    },
    'platformView': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => PlatformRouteWidget());
    },

    ///可以在native层通过 getContainerParams 来传递参数
    'flutterPage': (settings, uniqueId) {
      print('flutterPage settings:$settings, uniqueId:$uniqueId');
      return PageRouteBuilder<dynamic>(
        settings: settings,
        pageBuilder: (_, __, ___) => FlutterRouteWidget(
          params: settings.arguments,
          uniqueId: uniqueId,
        ),
        // transitionsBuilder: (BuildContext context, Animation<double> animation,
        //     Animation<double> secondaryAnimation, Widget child) {
        //   return SlideTransition(
        //     position: Tween<Offset>(
        //       begin: const Offset(1.0, 0),
        //       end: Offset.zero,
        //     ).animate(animation),
        //     child: SlideTransition(
        //       position: Tween<Offset>(
        //         begin: Offset.zero,
        //         end: const Offset(-1.0, 0),
        //       ).animate(secondaryAnimation),
        //       child: child,
        //     ),
        //   );
        // },
      );
    },
    'tab_friend': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a flutter fragment"));
    },
    'tab_message': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a flutter fragment"));
    },
    'tab_flutter1': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a custom FlutterView"));
    },
    'tab_flutter2': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => SimpleWidget(
              uniqueId, settings.arguments, "This is a custom FlutterView"));
    },

    'f2f_first': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => F2FFirstPage());
    },
    'f2f_second': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings, pageBuilder: (_, __, ___) => F2FSecondPage());
    },
    'mediaquery': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (_, __, ___) => MediaQueryRouteWidget(
            params: settings.arguments,
            uniqueId: uniqueId,
          ));
    },
    'createReduxApp': (settings, uniqueId) {
      return PageRouteBuilder<dynamic>(
          settings: settings,
          pageBuilder: (application, __, ___) => createReduxApp());
    },
    // createReduxApp

  };

  Route<dynamic> routeFactory(RouteSettings settings, String uniqueId) {
    FlutterBoostRouteFactory func = routerMap[settings.name];
    if (func == null) {
      return null;
    }
    return func(settings, uniqueId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBoostApp(routeFactory);
  }

  static Widget appBuilder(Widget home) {
    return MaterialApp(
      home: home,
    );
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {}
}

class BoostNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPush' + route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didPop' + route.settings.name);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didRemove' + route.settings.name);
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    print('boost-didStartUserGesture' + route.settings.name);
  }
}
