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
  TextEditingController _pesoControler = TextEditingController();
  TextEditingController _alturaControler = TextEditingController();
  String _resultado;

  @override
  void initState() {
    super.initState();
    resetFields();
  }

  void resetState() {
    _pesoControler.text = ' ';
    _alturaControler.text = ' ';

    setState(() {
      _resultado = 'Informe o seus dados';
    });
  }

  void resetFields() {
    _pesoControler.text = '';
    _alturaControler.text = '';
    setState(() {
      _resultado = 'Informe seus dados!';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildApp(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: buildFormulario(),
        ));
  }

  AppBar buildApp() {
    return AppBar(
      title: Text('Calc IMC'),
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

  Form buildFormulario() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildTextFormField(
            label: 'Peso: ',
            error: 'Isira seu peso',
            control: _pesoControler,
          ),
          buildTextFormField(
            label: 'Altura: ',
            error: 'Isira sua altura',
            control: _alturaControler,
          ),
          buildTextResult(),
          buildCalculateButton(),
        ],
      ),
    );
  }

  String calculaImc() {
    double peso = double.parse(_pesoControler.text);
    double altura = double.parse(_alturaControler.text) / 100.0;
    double imc = peso / (altura * altura);

    setState(() {
      _resultado = "IMC ${imc.toStringAsPrecision(2)}\n";
      if (imc < 18.6)
        _resultado += "Abaixo do peso";
      else if (imc < 25.0)
        _resultado += "Peso ideal";
      else if (imc < 30.0)
        _resultado += "Levemente acima do peso";
      else if (imc < 35.0)
        _resultado += "Obesidade Grau I";
      else if (imc < 40.0)
        _resultado += "Obesidade Grau II";
      else
        _resultado += "Obesidade Grau IIII";
    });
  }

  Padding buildCalculateButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36),
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            calculaImc();
          }
        },
        color: Colors.purple[500],
        child: Text(
          'Calcular',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Padding buildTextResult() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 36.0),
      child: Text(_resultado, textAlign: TextAlign.center),
    );
  }

  TextFormField buildTextFormField(
      {TextEditingController control, String error, String label}) {
    return TextFormField(
      controller: control,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        return value.isEmpty ? error : null;
      },
    );
  }
}
