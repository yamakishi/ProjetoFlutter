import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'vendas.dart';

class AddEditPageVendas extends StatefulWidget {
  DateTime date = DateTime.now();
  final List list;
  final int index;
  AddEditPageVendas({this.list,this.index});
  @override
  _AddEditPageVendasState createState() => _AddEditPageVendasState();
}

class _AddEditPageVendasState extends State<AddEditPageVendas> {
DateTime date = DateTime.now();
  TextEditingController nome= TextEditingController();
  TextEditingController data_nascimento = TextEditingController();
  TextEditingController data_compra = TextEditingController();


  bool editMode = false;


  addUpdateData(){
    if(editMode){
      var url = 'http://localhost/trabflutter/vendas/edit.php';
      http.post(Uri.parse(url),body: {
        'id' : widget.list[widget.index]['id'],
        'nome' : nome.text,
        'data_nascimento' : data_nascimento.text,
        'data_compra' : data_compra.text,

      });
    }else{
      var url = 'http://localhost/trabflutter/vendas/add.php';
      http.post(Uri.parse(url),body: {
        'nome' : nome.text,
        'data_nascimento' : data_nascimento.text,
        'data_compra' : data_compra.text,
      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      nome.text = widget.list[widget.index]['nome'];
      data_nascimento.text = widget.list[widget.index]['data_nascimento'];
      data_compra.text = widget.list[widget.index]['data_compra'];
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
              controller: nome,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'NOME DO CLIENTE:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: data_nascimento,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'DATA DE NASCIMENTO: ',
              ),
              readOnly: true,
              onTap: () async {
                DateTime newDateNascimento = await showDatePicker(
                context: context, 
                initialDate: date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                );
                if(newDateNascimento != null ){
                      print(newDateNascimento);
                      setState(() {
                         data_nascimento.text = '${newDateNascimento.year}/${newDateNascimento.month}/${newDateNascimento.day}'; //set output date to TextField value. 
                      });
                  }else{
                      print("A Data não foi selecionada!");
                  }
              },
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: data_compra,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'DATA DE COMPRA: ',
              ),
              readOnly: true,
              onTap: () async {
                DateTime newDateCompra = await showDatePicker(
                context: context, 
                initialDate: date,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                );
                if(newDateCompra != null ){
                      print(newDateCompra);
                      setState(() {
                         data_compra.text = '${newDateCompra.year}/${newDateCompra.month}/${newDateCompra.day}'; //set output date to TextField value. 
                      });
                  }else{
                      print("A Data não foi selecionada!");
                  }
              },
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.black),
              onPressed: (){
                setState(() {
                  addUpdateData();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => VendasPage(),),);
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
