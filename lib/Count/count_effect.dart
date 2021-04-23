import 'package:fish_redux/fish_redux.dart';

import 'count_action.dart';
import 'count_state.dart';

Effect<CountState> buildEffect() {
  return combineEffects(<Object, Effect<CountState>>{
    CountAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CountState> ctx) {
}
