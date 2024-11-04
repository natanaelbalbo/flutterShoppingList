import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';

class CategoryDropdown extends StatefulWidget {
  final Function(String) onCategorySelected;

  CategoryDropdown({required this.onCategorySelected});

  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  late Future<List<Category>> categories;
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    categories = ApiService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro ao carregar categorias');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Nenhuma categoria disponível');
        } else {
          return DropdownButtonFormField<String>(
            items: snapshot.data!.map((category) {
              return DropdownMenuItem<String>(
                value: category.id,
                child: Text(category.name),
              );
            }).toList(),
            onChanged: (value) {
              widget.onCategorySelected(value!);
              setState(() {
                selectedCategory = value;
              });
            },
            decoration: InputDecoration(labelText: 'Categoria'),
          );
        }
      },
    );
  }
}
