import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';
import '../components/item_tile.dart';

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  late Future<List<Item>> items;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  void fetchItems() {
    items = ApiService.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Itens'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                fetchItems();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Item>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar os itens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum item encontrado'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((item) => ItemTile(
                      item: item,
                      onDelete: () {
                        setState(() {
                          fetchItems();
                        });
                      }))
                  .toList(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-item').then((_) {
            setState(() {
              fetchItems();
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
