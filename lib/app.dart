import 'package:flutter/material.dart';
import 'home.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Views',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Arial",
          textTheme: const TextTheme(
              button: TextStyle(color: Colors.white, fontSize: 18.0),
              headline6: TextStyle(color: Colors.red))),
      home: Home(),
    );
  }
}