import 'package:flutter/material.dart';
import 'package:NeTinder/profile.dart';
import 'homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(),
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      )
    );
  }
}