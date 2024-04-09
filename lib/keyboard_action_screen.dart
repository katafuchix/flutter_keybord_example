import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

// https://qiita.com/noukindesu/items/9edc26078a2a975c2951
class Sample extends StatefulWidget {
  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final FocusNode _nodeText1 = FocusNode();

  int charLength = 0;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.black,
      nextFocus: false,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
          toolbarAlignment: MainAxisAlignment.start,
          displayArrows: false,
          toolbarButtons: [
                (node) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0),
                      child: GestureDetector(
                        onTap: () => node.unfocus(),
                        child: Text(
                          "完了",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "$charLength/10",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 100),
                      child: GestureDetector(
                        onTap: () => node.unfocus(),
                        child: Text(
                          "完了",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: KeyboardActions(
          config: _buildConfig(context),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    onChanged: _onChanged,
                    maxLength: 10,
                    maxLengthEnforcement: MaxLengthEnforcement.none,
                    keyboardType: TextInputType.text,
                    focusNode: _nodeText1,
                    decoration: InputDecoration(
                      hintText: "入力してね",
                      counterText: '',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
