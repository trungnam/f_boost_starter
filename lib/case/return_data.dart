import 'package:flutter/material.dart';
import 'package:flutter_boost/boost_navigator.dart';
import 'selection_screen.dart';

class ReturnDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Return data from a screen')),
        body: new Builder(builder: (BuildContext context) {
          return Center(
            child: ElevatedButton(
              child: Text('Pick an option, any option!'),
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
            ),
          );
        }));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result =
        await BoostNavigator.of().push('selectionScreen', withContainer: true);
    Scaffold.of(context);
      // .removeCurrentSnackBar()
      // .showSnackBar(SnackBar(content: Text("$result")));
  }
}
