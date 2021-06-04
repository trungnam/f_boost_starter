import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/gobal/global_state.dart';
import 'package:flutter_app_boost_new/guide/guide_adapter.dart';
import 'package:flutter_app_boost_new/guide/items/item_guide_state.dart';

class GuideState extends MutableSource implements Cloneable<GuideState>, GlobalBaseState {

  List<ItemGuideState> items;

  @override
  GuideState clone() {
    return GuideState()..items = items
    ..store = store;
  }

  @override
  StoreModel store;

  @override
  Object getItemData(int index) => items[index];

  @override
  String getItemType(int index) => GuideAdapter.item_style;

  @override
  int get itemCount => items.length;

  @override
  void setItemData(int index, Object data) {
    items[index] = data;
  }
}

GuideState initState(Map<String, dynamic> args) {
  return GuideState();
}
