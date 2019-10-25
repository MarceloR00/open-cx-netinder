import 'package:flutter/material.dart';
import 'homepage.dart';
import 'sign_up.dart';
import 'sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      )
    );
  }
}