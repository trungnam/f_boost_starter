import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'item_guide_state.dart';

Widget buildView(ItemGuideState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Card(
        child: Center(child: Text(state.itemDetail.advice.toString()),
        ),
    ),
  );
}
