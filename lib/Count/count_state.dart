import 'package:fish_redux/fish_redux.dart';

class CountState implements Cloneable<CountState> {

  @override
  CountState clone() {
    return CountState();
  }
}

CountState initState(Map<String, dynamic> args) {
  return CountState();
}
