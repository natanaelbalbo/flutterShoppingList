import 'package:flutter/material.dart';
import '../models/item.dart';
import '../services/api_service.dart';
import '../components/category_dropdown.dart';

class ItemEditFormScreen extends StatefulWidget {
  final Item item;

  ItemEditFormScreen({required this.item});

  @override
  _ItemEditFormScreenState createState() => _ItemEditFormScreenState();
}

class _ItemEditFormScreenState extends State<ItemEditFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String selectedCategoryId;

  @override
  void initState() {
    super.initState();
    name = widget.item.name;
    selectedCategoryId = widget.item.categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
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
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ApiService.updateItem(Item(
                        id: widget.item.id,
                        name: name,
                        categoryId: selectedCategoryId,
                        categoryName: widget.item.categoryName));
                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
