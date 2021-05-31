import 'package:fish_redux/fish_redux.dart';

import 'detail_guide_action.dart';
import 'detail_guide_state.dart';

Reducer<DetailGuideState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailGuideState>>{
      DetailGuideAction.action: _onAction,
    },
  );
}

DetailGuideState _onAction(DetailGuideState state, Action action) {
  final DetailGuideState newState = state.clone();
  return newState;
}
