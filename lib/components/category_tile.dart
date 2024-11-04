import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';
import '../screens/category_edit_form_screen.dart';

class CategoryTile extends StatelessWidget {
  final Category category;
  final VoidCallback onDelete;

  CategoryTile({required this.category, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryEditFormScreen(category: category),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ApiService.deleteCategory(category.id);
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
