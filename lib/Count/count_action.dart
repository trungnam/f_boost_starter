import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CountAction { action }

class CountActionCreator {
  static Action onAction() {
    return const Action(CountAction.action);
  }
}
