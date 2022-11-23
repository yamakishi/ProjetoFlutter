import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Cupons.dart';

class AddEditPageCupons extends StatefulWidget {
  final List list;
  final int index;
  AddEditPageCupons({this.list,this.index});
  @override
  _AddEditPageCuponsState createState() => _AddEditPageCuponsState();
}

class _AddEditPageCuponsState extends State<AddEditPageCupons> {

  TextEditingController descricao = TextEditingController();
  TextEditingController valor = TextEditingController();


  bool editMode = false;


  addUpdateData(){
    if(editMode){
      var url = 'http://localhost/trabflutter/Cupons/edit.php';
      http.post(Uri.parse(url),body: {
        'id' : widget.list[widget.index]['id'],
        'descricao' : descricao.text,
        'valor' : valor.text,

      });
    }else{
      var url = 'http://localhost/trabflutter/Cupons/add.php';
      http.post(Uri.parse(url),body: {
        'descricao' : descricao.text,
        'valor' : valor.text,
      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      descricao.text = widget.list[widget.index]['descricao'];
      valor.text = widget.list[widget.index]['valor'];
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
              controller: descricao,
              decoration: InputDecoration(
                icon: Icon(Icons.shopping_bag_rounded),
                labelText: 'Descrição do Cupom',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: valor,
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money_sharp),
                labelText: 'Valor do Cupom',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => CuponsPage(),),);
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
