import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum GlobalAction { action }

class GlobalActionCreator {
  static Action onAction() {
    return const Action(GlobalAction.action);
  }
}
