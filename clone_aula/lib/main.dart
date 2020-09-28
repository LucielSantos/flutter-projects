import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clone Aula",
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[900],
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Clone aula",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Text("Item 1"),
              Text("Item 2"),
              Text("Item 3"),
            ],
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Filter(),
              ClassCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Stack(children: [
            CardBody(),
            SizedBox(
              height: 20,
              width: 70,
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(bottom: 0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "123456",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

class CardBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CardInfo(),
          CardFooter(),
        ],
      ),
    );
  }
}

class CardFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: 5),
              SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.grey[400],
                        size: 25,
                      ),
                      SizedBox(width: 30),
                      Icon(
                        Icons.message,
                        color: Colors.grey[400],
                        size: 25,
                      ),
                      SizedBox(width: 30),
                      Icon(
                        Icons.info,
                        color: Colors.grey[400],
                        size: 25,
                      ),
                    ],
                  )),
              SizedBox(height: 5),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.green[700],
                  child: Text(
                    "Entrar na sala",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: double.infinity,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          margin: EdgeInsets.only(top: 10),
          color: Colors.blue[700],
          child: Padding(
            padding: EdgeInsets.only(top: 38, bottom: 38, left: 15, right: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Desenvolvimento de sistemas móveis",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Turma: 0159",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class Header extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            "Salas Virtuais",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class Filter extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Período:",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            "Este é um select huehuehue",
          ),
        ),
      ],
    );
  }
}
