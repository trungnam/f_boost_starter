import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'detail_guide_action.dart';
import 'detail_guide_state.dart';

Widget buildView(DetailGuideState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(key: Key(""), appBar: AppBar(title: Text("Detail")),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [

        ],),
      ),
      ),
    ),
    backgroundColor: Colors.tealAccent,
  );
}
