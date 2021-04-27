

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/guide/guide_state.dart';

import 'items/item_guide_component.dart';

class GuideAdapter extends SourceFlowAdapter<GuideState> {
  static const String item_style = "project_tab_item";

  GuideAdapter()
      : super(
    pool: <String, Component<Object>>{
      ///定义item的样式
      item_style: ItemGuideComponent(),
    },
  );
}
