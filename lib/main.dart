import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter_app_boost_new/Count/count_page.dart';
import 'package:flutter_app_boost_new/gobal/global_state.dart';
import 'package:flutter_app_boost_new/gobal/global_store.dart';
import 'package:flutter_app_boost_new/guide/guide_page.dart';

import 'config/main_development.dart';

// void main() {
//   //init application
//   var app = MainDartApplication();
//
//   if (kIsWeb) {
//     // running on the web!
//     runApp(createReduxApp());
//
//   } else {
//     // NOT running on the web! You can check for additional platforms here.
//     runApp(MyBoostApp());
//
//   }
// }


void main() => Development();

Widget createReduxApp() {
  return MaterialApp(
    title: 'FishRedux',
    home: RouteConfig.routes.buildPage(RouteConfig.guidePage, null), //作为默认页面
    onGenerateRoute: (RouteSettings settings) {
      //ios页面切换风格
      return CupertinoPageRoute(builder: (BuildContext context) {
        return RouteConfig.routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

///路由管理
class RouteConfig {
  ///定义你的路由名称比如   static final String routeHome = 'page/home';
  ///导航页面
  static const String guidePage = 'page/guide';

  ///计数器页面
  static const String countPage = 'page/count';

  ///页面传值跳转模块演示
  static const String firstPage = 'page/first';
  static const String secondPage = 'page/second';

  ///列表模块演示
  static const String listPage = 'page/list';
  static const String listEditPage = 'page/listEdit';

  ///Component
  static const String componentPage = 'page/component';

  static final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      ///将你的路由名称和页面映射在一起，比如：RouteConfig.homePage : HomePage(),
      RouteConfig.guidePage: GuidePage(),
      RouteConfig.countPage: CountPage(),
      // RouteConfig.firstPage: FirstPage(),
      // RouteConfig.secondPage: SecondPage(),
      // RouteConfig.listPage: ListPage(),
      // RouteConfig.listEditPage: ListEditPage(),
      // RouteConfig.componentPage: CompPage(),
    },
    visitor: StoreConfig.visitor,
  );
}

///全局模式
class StoreConfig {
  ///全局状态管理
  static _updateState() {
    return (Object pageState, GlobalState appState) {
      final GlobalBaseState p = pageState;

      if (pageState is Cloneable) {
        final Object copy = pageState.clone();
        final GlobalBaseState newState = copy;

        if (p.store == null) {
          ///这地方的判断是必须的，判断第一次store对象是否为空
          newState.store = appState.store;
        } else {
          /// 这地方增加字段判断，是否需要更新
          if ((p.store.themeColor != appState.store.themeColor)) {
            newState.store.themeColor = appState.store.themeColor;
          }

          /// 下列一系列对比...

        }

        /// 返回新的 state 并将数据设置到 ui
        return newState;
      }
      return pageState;
    };
  }

  static visitor(String path, Page<Object, dynamic> page) {
    if (page.isTypeof<GlobalBaseState>()) {
      ///建立AppStore驱动PageStore的单向数据连接
      ///参数1 AppStore  参数2 当AppStore.state变化时,PageStore.state该如何变化
      page.connectExtraStore<GlobalState>(GlobalStore.store, _updateState());
    }
  }
}

