import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_boost_new/guide/guide_action.dart';
import 'package:flutter_app_boost_new/guide/items/item_guide_action.dart';
import 'package:flutter_app_boost_new/utility/log/Log.dart';

import 'item_guide_state.dart';

Widget buildView(
    ItemGuideState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      child: Card(
        child: addContainer(state),
        elevation: 5,
      ),
      onTap: () {
        // dispatch(ItemGuideActionCreator.click(state.itemId));

        dispatch(GuideActionCreator.onClick());

      },
    ),
  );
}

Container addContainer(ItemGuideState state) {
  return Container(
    child: Text(state.itemDetail.advice.toString()),
    padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
  );
}
