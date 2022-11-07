import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/guide/guide_view.dart';

//TODO replace with your own action
enum GuideAction {
  action,
  click,
  menuClick,
  updateItem,
  refreshList
}

class GuideActionCreator {
  static Action onAction() {
    return const Action(GuideAction.action);
  }

  static Action onClick() {
    return const Action(GuideAction.click);
  }

  static Action updateItem(var list) {
    return Action(GuideAction.updateItem, payload: list);
  }

  static Action refreshList() {
    return Action(GuideAction.refreshList);
  }

  static Action menuClick(MenuItemType item) {
    return Action(GuideAction.menuClick, payload: item);
  }
}
