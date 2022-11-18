import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phpmysqlcrud/AddEditPageVendas.dart';
import 'AddEditPageVendas.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listando Vendas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VendasPage(),
    );
  }
}

class VendasPage extends StatefulWidget {
  @override
  _VendasPageState createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {
  Future getData() async {
    var url = 'http://localhost/trabFlutter/Vendas/read.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: meuDrawer(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 35, 35),
        centerTitle: true,
        title: Text('Listando Vendas'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditPageVendas(),
            ),
          );
          debugPrint('O "FloatingActionButton" foi apertado!');
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddEditPageVendas(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint('O Botão "Edit" foi apertado!');
                        },
                      ),
                      title: Text('ID DO PRODUTO: ${list[index]['id']}'),
                      subtitle: Text('DESCRIÇÃO: ${list[index]['descricao']} \nVALOR: R\$ ${list[index]['valor']}', ),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            var url = 'http://localhost/trabflutter/Vendas/delete.php';
                            http.post(Uri.parse(url), body: {
                              'id': list[index]['id'],
                            });
                          });
                          debugPrint('O botão "Delete" foi apertado!');
                        },
                      ),
                    );
                  })
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
