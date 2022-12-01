import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'paginadeedit.dart';
import 'menucomdrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listando Carro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CarroPage(),
    );
  }
}

class CarroPage extends StatefulWidget {
  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  Future getData() async {
    var url = 'http://localhost/prova-yama/Carro/read.php';
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
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          'Listando Carro',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Text(
          "ADD",
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditPageCarro(),
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
                              builder: (context) => AddEditPageCarro(
                                list: list,
                                index: index,
                              ),
                            ),
                          );
                          debugPrint('O Botão "Edit" foi apertado!');
                        },
                      ),
                      title: Text('ID DO CARRO: ${list[index]['idCarro']}'),
                      subtitle: Text(
                        'NOME DO CARRO: ${list[index]['nomeCarro']} \nkmPorLitroAlcool: ${list[index]['kmPorLitroAlcool']} \nkmPorLitroGasolina: ${list[index]['kmPorLitroGasolina']}',
                      ),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            var url =
                                'http://localhost/prova-yama/Carro/delete.php';
                            http.post(Uri.parse(url), body: {
                              'idCarro': list[index]['idCarro'],
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
