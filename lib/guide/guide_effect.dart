import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/widgets.dart' hide Action;

import '../main.dart';
import 'guide_action.dart';
import 'guide_state.dart';

Effect<GuideState> buildEffect() {
  return combineEffects(<Object, Effect<GuideState>>{
    GuideAction.action: _onAction,
    GuideAction.click: _toClick,

  });
}

void _onAction(Action action, Context<GuideState> ctx) {
}

void _toClick(Action action, Context<GuideState> ctx) {
  Navigator.pushNamed(ctx.context, RouteConfig.countPage);
}