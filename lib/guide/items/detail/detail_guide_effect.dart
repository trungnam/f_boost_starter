import 'package:fish_redux/fish_redux.dart';

import 'detail_guide_action.dart';
import 'detail_guide_state.dart';

Effect<DetailGuideState> buildEffect() {
  return combineEffects(<Object, Effect<DetailGuideState>>{
    DetailGuideAction.action: _onAction,
  });
}

void _onAction(Action action, Context<DetailGuideState> ctx) {
}
