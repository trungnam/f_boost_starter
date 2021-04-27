import 'package:fish_redux/fish_redux.dart';

import 'item_guide_state.dart';
import 'item_guide_view.dart';

class ItemGuideComponent extends Component<ItemGuideState> {
  ItemGuideComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<ItemGuideState>(
                adapter: null,
                slots: <String, Dependent<ItemGuideState>>{
                }),);

}
