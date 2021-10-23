

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:flutter_app_boost_new/guide/items/item_guide_action.dart';

import '../../main.dart';
import 'item_guide_state.dart';

Effect<ItemGuideState> buildEffect() {
  return combineEffects(<Object, Effect<ItemGuideState>>{
    ItemGuideAction.click: _onClick,
  });
}

void _onClick(Action action, Context<ItemGuideState> ctx) {
  if (action.payload == ctx.state.itemId) {

  }
}
