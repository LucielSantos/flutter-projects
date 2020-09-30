import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                Filter(),
                ClassCard(),
                ClassCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String _value = '2020/2';

  @override
  void initState() {
    super.initState();
  }

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
          padding: EdgeInsets.only(top: 5),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              border: Border.all(color: Colors.grey[400]),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(child: Text("2020/2"), value: '2020/2'),
                    DropdownMenuItem(child: Text("2020/1"), value: '2020/1'),
                    DropdownMenuItem(child: Text("2019/2"), value: '2019/2'),
                    DropdownMenuItem(child: Text("2019/3"), value: '2019/3')
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  }),
            ),
          ),
        ),
      ],
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
