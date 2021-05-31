import 'package:fish_redux/fish_redux.dart';

import 'detail_guide_effect.dart';
import 'detail_guide_reducer.dart';
import 'detail_guide_state.dart';
import 'detail_guide_view.dart';

class DetailGuidePage extends Page<DetailGuideState, Map<String, dynamic>> {
  DetailGuidePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DetailGuideState>(
                adapter: null,
                slots: <String, Dependent<DetailGuideState>>{
                }),
            middleware: <Middleware<DetailGuideState>>[
            ],);

}
