import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/guide/guide_adapter.dart';
import 'guide_effect.dart';
import 'guide_reducer.dart';
import 'guide_state.dart';
import 'guide_view.dart';

class GuidePage extends Page<GuideState, Map<String, dynamic>> {
  GuidePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<GuideState>(
                adapter: NoneConn<GuideState>() + GuideAdapter(),
                slots: <String, Dependent<GuideState>>{}),
            middleware: <Middleware<GuideState>>[
            ],);

}
