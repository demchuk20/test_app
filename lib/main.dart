import 'package:flutter/material.dart';
import 'package:test_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(title: 'Test app'),
    );
  }
}
