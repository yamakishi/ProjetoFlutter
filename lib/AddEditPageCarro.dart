import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'carro.dart';

class AddEditPageCarro extends StatefulWidget {
  final List list;
  final int index;
  AddEditPageCarro({this.list,this.index});
  @override
  _AddEditPageCarroState createState() => _AddEditPageCarroState();
}

class _AddEditPageCarroState extends State<AddEditPageCarro> {

  TextEditingController nomeCarro = TextEditingController();
  TextEditingController kmPorLitroAlcool = TextEditingController();
  TextEditingController kmPorLitroGasolina = TextEditingController();


  bool editMode = false;


  addUpdateData(){
    if(editMode){
      var url = 'http://localhost/prova-flutter/Carro/edit.php';
      http.post(Uri.parse(url),body: {
        'idCarro' : widget.list[widget.index]['idCarro'],
        'nomeCarro' : nomeCarro.text,
        'kmPorLitroAlcool' : kmPorLitroAlcool.text,
        'kmPorLitroGasolina' : kmPorLitroGasolina.text

      });
    }else{
      var url = 'http://localhost/prova-flutter/Carro/add.php';
      http.post(Uri.parse(url),body: {
        'nomeCarro' : nomeCarro.text,
        'kmPorLitroAlcool' : kmPorLitroAlcool.text,
        'kmPorLitroGasolina' : kmPorLitroGasolina.text
      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      nomeCarro.text = widget.list[widget.index]['nomeCarro'];
      kmPorLitroAlcool.text = widget.list[widget.index]['kmPorLitroAlcool'];
      kmPorLitroGasolina.text = widget.list[widget.index]['kmPorLitroGasolina'];
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: Text(editMode ? 'Atualizar' :'Adicionar'),),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nomeCarro,
              decoration: InputDecoration(
                icon: Icon(Icons.car_crash),
                labelText: 'Nome do Carro',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: kmPorLitroAlcool,
              decoration: InputDecoration(
                icon: Icon(Icons.settings_ethernet),
                labelText: 'KM/L Alcool',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: kmPorLitroGasolina,
              decoration: InputDecoration(
                icon: Icon(Icons.settings_ethernet),
                labelText: 'KM/L Gasolina',
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.black),
           
              onPressed: (){
                setState(() {
                  addUpdateData();
                }
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => CarroPage(),),);
                debugPrint('O "ElevatedButton" foi apertado!');
              },
             // color: Colors.blue,
              child: Text(editMode ? 'Atualizar' :'Salvar',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
