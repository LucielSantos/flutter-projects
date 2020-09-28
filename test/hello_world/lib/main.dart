import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello App',
        home: Scaffold(
            appBar: AppBar(
              title: Text('My App Bar'),
              backgroundColor: Colors.indigo[600],
            ),
            body: Center(
                child: Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900]),
            ))));
  }
}
