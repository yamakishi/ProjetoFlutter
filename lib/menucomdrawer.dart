import 'package:flutter/material.dart';
import 'paginainicio.dart';
import 'listapi.dart';
import 'calcular.dart';
import 'menucomdrawer.dart';

class meuDrawer extends StatelessWidget {
  const meuDrawer({key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage('assets/images/backzin.jpg'),
                // fit: BoxFit.cover,
              ),
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
