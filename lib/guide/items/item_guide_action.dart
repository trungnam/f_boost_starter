import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemGuideAction { action, click }

class ItemGuideActionCreator {
  static Action onAction() {
    return const Action(ItemGuideAction.action);
  }

  static Action click(String itemId) {
    return const Action(ItemGuideAction.click);

  }
}
