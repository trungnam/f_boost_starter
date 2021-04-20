import 'package:fish_redux/fish_redux.dart';

import 'global_action.dart';
import 'global_state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
      GlobalAction.action: _onAction,
    },
  );
}

GlobalState _onAction(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  return newState;
}
