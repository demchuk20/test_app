import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState(title);
}

class HomeState extends State {
  final String title;
  Color _color = Colors.white;
  Color _textColor = Colors.black;

  HomeState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: _color,
      body: Stack(children: [
        Center(
            child: Text(
          'Hey there!! Color is ${_color.value.toRadixString(16)}',
          style: TextStyle(color: _textColor),
        )),
        GestureDetector(onTap: _colorChange)
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _refresh,
        child: Icon(Icons.refresh),
        tooltip: 'Refresh',
      ),
    );
  }

  Color _complimentary(Color color) {
    var colorText = (~color.value) & 0xffffffff;
    colorText = colorText | 0xff000000;
    return Color(colorText);
  }

  void _colorChange() {
    setState(() {
      Random random = Random();
      _color = Color.fromARGB(
          random.nextInt(0xff + 0x1),
          random.nextInt(0xff + 0x1),
          random.nextInt(0xff + 0x1),
          random.nextInt(0xff + 0x1));
      _textColor = _complimentary(_color);
    });
  }

  void _refresh() {
    setState(() {
      _color = Colors.white;
      _textColor = Colors.black;
    });
  }
}
