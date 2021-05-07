import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _RandomWidgetState(),
    );
  }
}

class _RandomWidgetState extends StatefulWidget {
  _RandomWidgetState({Key key}) : super(key: key);

  @override
  _RandomWidgetStateState createState() => _RandomWidgetStateState();
}

class _RandomWidgetStateState extends State<_RandomWidgetState> {
  var randomnumber = 0;
  var random = 1;

  _makeRandomNumber() {
    setState(() {
      randomnumber = Random().nextInt(50) + 1;
      print(randomnumber);
    });
  }

  _makeRandom() {
    setState(() {
      random = Random().nextInt(50) + 1;
      print(random);
    });
  }

  func() {
    // var success = "success";
    if (randomnumber == random) {
      return Center(
        child: Text(
          'success',
          style: TextStyle(
              fontSize: 30,
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const curveHeight = 10.0;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('RandomNumbers'),
        shape: const MyShapeBorder(curveHeight),
        backgroundColor: Colors.pinkAccent[400],
      ),
      body: Card(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 280,
              decoration: BoxDecoration(border: Border.all()),
              child: func(),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('$randomnumber'),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 20,
                        ),
                        child: FloatingActionButton(
                          backgroundColor: Colors.pinkAccent,
                          elevation: 2,
                          onPressed: () {
                            _makeRandomNumber();
                            _makeRandom();
                          },
                          child: new Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: 250,
                  width: 150,
                  decoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('$random'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyShapeBorder extends ContinuousRectangleBorder {
  const MyShapeBorder(this.curveHeight);
  final double curveHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + curveHeight * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
