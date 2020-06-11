import 'dart:ffi';

import 'package:flutter/material.dart';

class BackgroundManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BackgroundManagerState();
  }
}

class _BackgroundManagerState extends State<BackgroundManager> {
  Color color = const Color(0xff090909);
  Color defaultColor;
  Color onButtonColor;
  Color offButtonColor;
  bool canChange = false;

  Future<void> _showAlert() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert!!'),
            content: SingleChildScrollView(
                child:
                    Text('Please select ON button to change background color')),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  void changeBackgroundColorTo(Color c) {
    if (canChange == true) {
      setState(() {
        color = c;
      });
    } else {
      _showAlert();
    }
  }

  void onButtonPressed() {
    setState(() {
      canChange = true;
      onButtonColor = Colors.amberAccent;
      offButtonColor = defaultColor;
    });
  }

  void offButtonPressed() {
    setState(() {
      canChange = false;
      offButtonColor = Colors.amberAccent;
      onButtonColor = defaultColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: color,
            appBar: AppBar(
              title: Text('Sachin'),
            ),
            body: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {
                            changeBackgroundColorTo(const Color(0xffFDFEFE));
                          },
                          child: Text('White')),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {
                            changeBackgroundColorTo(const Color(0xff74D5EF));
                          },
                          child: Text('Blue')),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {
                            changeBackgroundColorTo(const Color(0xff090909));
                          },
                          child: Text('Black')),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          onPressed: () {
                            changeBackgroundColorTo(const Color(0xff626162));
                          },
                          child: Text('Silver')),
                    ),
                  ],
                ),
                Card(
                  color: color,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/Sachin_BatonRouge.jpg',
                        height: 600,
                        width: 1000,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          color: onButtonColor,
                          onPressed: () {
                            onButtonPressed();
                          },
                          child: Text('On')),
                    ),
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: RaisedButton(
                          color: offButtonColor,
                          onPressed: () {
                            offButtonPressed();
                          },
                          child: Text('Off')),
                    ),
                  ],
                ),
              ],
            )));
  }
}
