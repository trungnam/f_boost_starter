import 'package:fish_redux/fish_redux.dart';

import 'count_effect.dart';
import 'count_reducer.dart';
import 'count_state.dart';
import 'count_view.dart';

class CountPage extends Page<CountState, Map<String, dynamic>> {
  CountPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CountState>(
                adapter: null,
                slots: <String, Dependent<CountState>>{
                }),
            middleware: <Middleware<CountState>>[
            ],);

}
