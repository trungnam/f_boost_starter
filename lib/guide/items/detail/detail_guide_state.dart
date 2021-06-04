import 'package:fish_redux/fish_redux.dart';

class DetailGuideState implements Cloneable<DetailGuideState> {

  @override
  DetailGuideState clone() {
    return DetailGuideState();
  }
}

DetailGuideState initState(Map<String, dynamic> args) {
  return DetailGuideState();
}
