import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/model/response/AdviceResponse.dart';

import '../guide_view.dart';

class ItemGuideState implements Cloneable<ItemGuideState> {
  Slip itemDetail;

  ItemGuideState({this.itemDetail});

  @override
  ItemGuideState clone() {
    return ItemGuideState()
      ..itemDetail = itemDetail;
  }
}

ItemGuideState initState(Map<String, dynamic> args) {
  return ItemGuideState();
}
