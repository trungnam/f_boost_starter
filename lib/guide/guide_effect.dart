import 'dart:math';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart'hide Action;
import 'package:flutter/widgets.dart' hide Action;
import 'package:flutter_app_boost_new/core/MainFApplication.dart';
import 'package:flutter_app_boost_new/guide/guide_view.dart';
import 'package:flutter_app_boost_new/guide/items/item_guide_state.dart';
import 'package:flutter_app_boost_new/model/APIProvider.dart';

import '../main.dart';
import 'guide_action.dart';
import 'guide_state.dart';

Effect<GuideState> buildEffect() {
  return combineEffects(<Object, Effect<GuideState>>{
    GuideAction.action: _onAction,
    GuideAction.click: _toClick,
    Lifecycle.initState: _init,
    GuideAction.refreshList: _onRefresh,
  });
}

void _onAction(Action action, Context<GuideState> ctx) {
}

void _toClick(Action action, Context<GuideState> ctx) {
  Navigator.pushNamed(ctx.context, RouteConfig.countPage);
}

void _init(Action action, Context<GuideState> ctx) async {
  APIProvider apiProvider = APIProvider();
  apiProvider.getSearchAdvice("d").then((value) {
    var advice = value;
    var list = advice.slips;

    List<ItemGuideState> items = List.generate(list.length, (index) {
      return ItemGuideState(itemDetail: list[index]);
    });
    ctx.dispatch(GuideActionCreator.updateItem(items));

  });
}

void _onRefresh(Action action, Context<GuideState> ctx) async {
  // ignore: unnecessary_statements
  var random = Random();
  var strs = ['spiders','see','ok'];

  MainDartApplication().apiRepository.
  getAdviceList(strs[random.nextInt(2)])
      .listen((value) {
    var advice = value;
    var list = advice.slips;

    List<ItemGuideState> items = List.generate(list.length, (index) {
      return ItemGuideState(itemDetail: list[index]);
    });
    ctx.dispatch(GuideActionCreator.updateItem(items));
  });

}