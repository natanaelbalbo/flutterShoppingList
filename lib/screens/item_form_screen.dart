import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';
import '../components/category_dropdown.dart';

class ItemFormScreen extends StatefulWidget {
  @override
  _ItemFormScreenState createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String selectedCategoryId = '';
  String selectedCategoryName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome do Item'),
                onChanged: (value) {
                  name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              CategoryDropdown(
                onCategorySelected: (id) {
                  selectedCategoryId = id;
                  selectedCategoryName = "";
                  ApiService.getCategories().then((categories) {
                    for (var category in categories) {
                      if (category.id == selectedCategoryId) {
                        selectedCategoryName = category.name;
                      }
                    }
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ApiService.addItem(Item(
                        id: '',
                        name: name,
                        categoryId: selectedCategoryId,
                        categoryName: selectedCategoryName));
                    Navigator.pop(context);
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
