import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GuideAction {
  action,
  click,
  updateItem,

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
}
