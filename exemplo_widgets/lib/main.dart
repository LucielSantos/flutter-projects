import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Exemplos widgets",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo de widgets"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Text("Item 1"),
              Divider(),
              Text("Item 2"),
              Divider(),
              Text("Item 3"),
            ],
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Card(
                color: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      MyFruits('Bergamota'),
                      Divider(),
                      MyFruits('Melancia'),
                      Divider(),
                      MyFruits('Laranja'),
                      Divider(color: Colors.white),
                      Counter('Inter'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFruits extends StatelessWidget {
  final String text;

  const MyFruits(this.text);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.purple[700],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final String time;

  Counter(this.time);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          count++;
        });
      },
      child: MyFruits('$count'),
    );
  }
}
