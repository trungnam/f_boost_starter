import 'package:fish_redux/fish_redux.dart';

import 'count_action.dart';
import 'count_state.dart';

Reducer<CountState> buildReducer() {
  return asReducer(
    <Object, Reducer<CountState>>{
      CountAction.action: _onAction,
    },
  );
}

CountState _onAction(CountState state, Action action) {
  final CountState newState = state.clone();
  return newState;
}
