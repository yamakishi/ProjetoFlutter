import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController valorxCalculo = TextEditingController();
  TextEditingController valoryCalculo = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "";

  void _resetFields() {
    valorxCalculo.text = "";
    valoryCalculo.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double x = double.parse(valorxCalculo.text);
      double y = double.parse(valoryCalculo.text);
      double z = x / y;

      // ÁREA DE CALCULO

      if (z < 0.7) {
        _infoText = "X";
      } else {
        _infoText = "Y";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TÍTULO
        title: Text(
          "Calculadora Atividade",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

        // COR DO BACKGROUND DO MENU
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),

      // COR DO BACKGROUND
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // VALOR A
                    labelText: "Valor X",
                    labelStyle: TextStyle(color: Colors.red)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                controller: valorxCalculo,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira o valor de X!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    // VALOR B
                    labelText: "Valor Y",
                    labelStyle: TextStyle(color: Colors.red)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
                controller: valoryCalculo,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira o valor de Y";
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                        onPressed: _calculate,
                        child: Text(
                          "Calcular",
                          style: TextStyle(color: Colors.black, fontSize: 25.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ))),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
