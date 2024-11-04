import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';
import '../screens/item_edit_form_screen.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  final VoidCallback onDelete;

  ItemTile({required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.name),
      subtitle: Text('Categoria: ${item.categoryName}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemEditFormScreen(item: item),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ApiService.deleteItem(item.id);
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
