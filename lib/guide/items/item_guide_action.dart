import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum ItemGuideAction { action }

class ItemGuideActionCreator {
  static Action onAction() {
    return const Action(ItemGuideAction.action);
  }
}
