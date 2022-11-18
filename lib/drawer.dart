import 'package:flutter/material.dart';
import 'package:phpmysqlcrud/clientes.dart';
import 'package:phpmysqlcrud/inicio.dart';
import 'package:phpmysqlcrud/produtos.dart';
import 'drawer.dart';


class meuDrawer extends StatelessWidget {
  const meuDrawer({key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/images/risa.png'),
                 // fit: BoxFit.cover,
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Inicio"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => InitialPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text("Produtos"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProdutosPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.ballot_rounded),
              title: Text("Clientes"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ClientePage(),
                ));
              },
            ),
          ],
        ),
      );
  }
}