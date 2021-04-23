import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'count_action.dart';
import 'count_state.dart';

Widget buildView(CountState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(key: Key(""), appBar: AppBar(title: Text("Title")),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          CommonWidget.createbutton(),
          CommonWidget.createbutton(),
          CommonWidget.createbutton(),
        ],),
      ),
      ),
    ),
    backgroundColor: Colors.tealAccent,
  );
}

class EmptyPage extends StatelessWidget {
  final String title;

  EmptyPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: TextButton( key: Key("button"),)),
    );
  }
}

class CommonWidget {
  static Widget createbutton() {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused))
                return Colors.red;
              return null; // Defer to the widget's default.
            }
        ),
      ),
      onPressed: () { },
      child: Text('TextButton'),
    );
  }
}
