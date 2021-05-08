import 'dart:developer';
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
  var count = 0;
  var num;

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
    if (randomnumber == random) {
      count++;
      print(count);

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'success',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
          Text(
            'count :$count',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ],
      );
    } else if (randomnumber != random) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pls try again later',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.thumb_down,
              color: Colors.red,
            )
          ],
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
        color: Colors.grey[200],
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
                        child: Text(
                          '$randomnumber',
                          style: TextStyle(
                              color: Colors.pinkAccent[700], fontSize: 20),
                        ),
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
                        child: Text(
                          '$random',
                          style: TextStyle(
                              color: Colors.pinkAccent[700], fontSize: 20),
                        ),
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
