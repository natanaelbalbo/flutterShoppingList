import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Compras')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu de Navegação',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Ver Categorias'),
              onTap: () {
                Navigator.pushNamed(context, '/categories');
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Ver Lista de Compras'),
              onTap: () {
                Navigator.pushNamed(context, '/items');
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Adicionar Novo Item'),
              onTap: () {
                Navigator.pushNamed(context, '/add-item');
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle),
              title: Text('Adicionar Nova Categoria'),
              onTap: () {
                Navigator.pushNamed(context, '/add-category');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo à Lista de Compras!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/items');
              },
              child: Text('Ver Listas de Compras'),
            ),
          ],
        ),
      ),
    );
  }
}
