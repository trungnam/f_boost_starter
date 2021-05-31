import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailGuideAction { action }

class DetailGuideActionCreator {
  static Action onAction() {
    return const Action(DetailGuideAction.action);
  }
}
