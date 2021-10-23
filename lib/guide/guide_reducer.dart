import 'package:fish_redux/fish_redux.dart';

import 'guide_action.dart';
import 'guide_state.dart';

Reducer<GuideState> buildReducer() {
  return asReducer(
    <Object, Reducer<GuideState>>{
      GuideAction.action: _onAction,
      GuideAction.updateItem: _updateItem,

    },
  );
}

GuideState _onAction(GuideState state, Action action) {
  final GuideState newState = state.clone();
  return newState;
}

GuideState _updateItem(GuideState state, Action action) {
  return state.clone()..items = action.payload;
}
