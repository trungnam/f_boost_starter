import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/model/response/AdviceResponse.dart';

class ItemGuideState implements Cloneable<ItemGuideState> {
  Slip itemDetail;
  String itemId;

  static int _seed = 202103051044;

  ItemGuideState({this.itemDetail, this.itemId}) {
      this.itemId ??= "${_seed++}";
  }

  @override
  ItemGuideState clone() {
    return ItemGuideState()
      ..itemDetail = itemDetail;
  }
}

ItemGuideState initState(Map<String, dynamic> args) {
  return ItemGuideState();
}
