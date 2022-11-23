import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'vendas.dart';

const List<String> lista_produto = <String>[
  'Selecione o Produto',
  'One',
  'Two',
  'Three',
  'Four'
];
const List<String> lista_cliente = <String>[
  'Selecione o Cliente',
  'One',
  'Two',
  'Three',
  'Four'
];
const List<String> lista_cupon = <String>[
  'Selecione o Cupon',
  'One',
  'Two',
  'Three',
  'Four'
];

class AddEditPageVendas extends StatefulWidget {
  DateTime date = DateTime.now();
  final List list;
  final int index;
  AddEditPageVendas({this.list, this.index});
  @override
  _AddEditPageVendasState createState() => _AddEditPageVendasState();
}

class _AddEditPageVendasState extends State<AddEditPageVendas> {
  DateTime date = DateTime.now();
  TextEditingController id_produto = TextEditingController();
  TextEditingController id_cliente = TextEditingController();
  TextEditingController id_cupom = TextEditingController();
  TextEditingController qtd = TextEditingController();
  TextEditingController data_venda = TextEditingController();

  String dropdownValueProduto = lista_produto.first;
  String dropdownValueCliente = lista_cliente.first;
  String dropdownValueCupon = lista_cupon.first;


  bool editMode = false;

  addUpdateData() {
    if (editMode) {
      var url = 'http://localhost/trabflutter/vendas/edit.php';
      http.post(Uri.parse(url), body: {
        'id': widget.list[widget.index]['id'],
        'id_produto': id_produto.text,
        'id_cliente': id_cliente.text,
        'id_cupom': id_cupom.text,
        'qtd': qtd.text,
        'data_venda': data_venda.text,
      });
    } else {
      var url = 'http://localhost/trabflutter/vendas/add.php';
      http.post(Uri.parse(url), body: {
        'id_produto': id_produto.text,
        'id_cliente': id_cliente.text,
        'id_cupom': id_cupom.text,
        'qtd': qtd.text,
        'data_venda': data_venda.text,
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      editMode = true;
      id_produto.text = widget.list[widget.index]['id_produto'];
      id_cliente.text = widget.list[widget.index]['id_cliente'];
      id_cupom.text = widget.list[widget.index]['id_cupom'];
      qtd.text = widget.list[widget.index]['qtd'];
      data_venda.text = widget.list[widget.index]['data-venda'];
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: Text(editMode ? 'Atualizar' : 'Adicionar'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: dropdownValueProduto,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(),
              underline: Container(
                height: 2,
              ),
              onChanged: (String value) {
                setState(() {
                  dropdownValueProduto = value;
                });
              },
              items:
                  lista_produto.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: dropdownValueCliente,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(),
              underline: Container(
                height: 2,
              ),
              onChanged: (String value) {
                setState(() {
                  dropdownValueCliente = value;
                });
              },
              items:
                  lista_cliente.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: dropdownValueCupon,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(),
              underline: Container(
                height: 2,
              ),
              onChanged: (String value) {
                setState(() {
                  dropdownValueCupon = value;
                });
              },
              items:
                  lista_cupon.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: qtd,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'QUANTIDADE:',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: data_venda,
              decoration: InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: 'DATA DE COMPRA: ',
              ),
              readOnly: true,
              onTap: () async {
                DateTime newDateVenda = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (newDateVenda != null) {
                  print(newDateVenda);
                  setState(() {
                    data_venda.text =
                        '${newDateVenda.year}/${newDateVenda.month}/${newDateVenda.day}'; //set output date to TextField value.
                  });
                } else {
                  print("A Data não foi selecionada!");
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  addUpdateData();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VendasPage(),
                  ),
                );
                debugPrint('O "ElevatedButton" foi apertado!');
              },
              // color: Colors.blue,
              child: Text(
                editMode ? 'Atualizar' : 'Salvar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
