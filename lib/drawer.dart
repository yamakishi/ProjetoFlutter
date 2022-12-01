import 'package:flutter/material.dart';
import 'inicio.dart';
import 'carro.dart';
import 'calculadora.dart';
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
                  image: AssetImage('assets/images/fusca.png'),
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
              leading: Icon(Icons.shopping_bag_rounded),
              title: Text("Carro"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CarroPage(),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text("Calculadora"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Calculadora(),
                ));
              },
            ),
          ],
        ),
      );
  }
}