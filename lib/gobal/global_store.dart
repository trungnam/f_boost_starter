

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_boost_new/gobal/global_reducer.dart';
import 'package:flutter_app_boost_new/gobal/global_state.dart';

class GlobalStore{
  static Store<GlobalState> _globalStore;
  static Store<GlobalState> get store => _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}