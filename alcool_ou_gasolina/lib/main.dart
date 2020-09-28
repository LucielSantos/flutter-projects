import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _gasolinaController = TextEditingController();
  TextEditingController _alcoolController = TextEditingController();
  String _showText;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetState() {
    _gasolinaController.text = ' ';
    _alcoolController.text = ' ';

    setState(() {
      _showText = 'Informe os valores';
    });
  }

  void resetFields() {
    _gasolinaController.text = '';
    _alcoolController.text = '';

    setState(() {
      _showText = 'Informe os valores';
    });
  }

  String calculate() {
    double gasolina = double.parse(_gasolinaController.text);
    double alcool = double.parse(_alcoolController.text);

    double result = double.parse((alcool / gasolina).toStringAsPrecision(2));

    setState(() {
      if (result < 0.7) {
        _showText = 'O álcool vale mais a pena';
      } else {
        _showText = 'A gasolina vale mais a pena';
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildMain(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text('Alcool ou Gasolina'),
      backgroundColor: Colors.purple[900],
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            resetFields();
          },
        )
      ],
    );
  }

  Container buildMain() {
    return Container(
        color: Colors.grey[900],
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: buildContainer(),
        ));
  }

  Container buildContainer() {
    return Container(
      padding: EdgeInsets.all(50),
      alignment: Alignment.center,
      child: buildForm(),
    );
  }

  Column buildFormContainer() {
    return Column(
      children: <Widget>[
        buildTextFormField(
          control: _gasolinaController,
          label: 'Valor da gasolina',
          error: 'Insira o valor da gasolina',
        ),
        buildTextFormField(
          control: _alcoolController,
          label: 'Valor do alcool',
          error: 'Insira o valor do alcool',
        ),
        buildResult(),
        buildCalculateButton(),
      ],
    );
  }

  Form buildForm() {
    return Form(
      child: buildFormContainer(),
      key: _formKey,
    );
  }

  Container buildTextFormField(
      {TextEditingController control, String error, String label}) {
    return Container(
        margin: EdgeInsets.only(bottom: 40),
        child: TextFormField(
          controller: control,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.purple[300]),
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            prefix: Text(
              'R\$ ',
              style: TextStyle(color: Colors.purple[300]),
            ),
          ),
          validator: (value) {
            return value.isEmpty ? error : null;
          },
        ));
  }

  RaisedButton buildCalculateButton() {
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          calculate();
        }
      },
      color: Colors.purple[900],
      child: Text(
        'Calcular',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Padding buildResult() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
      ),
      child: Text(
        _showText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
