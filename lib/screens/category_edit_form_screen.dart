import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';

class CategoryEditFormScreen extends StatefulWidget {
  final Category category;

  CategoryEditFormScreen({required this.category});

  @override
  _CategoryEditFormScreenState createState() => _CategoryEditFormScreenState();
}

class _CategoryEditFormScreenState extends State<CategoryEditFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;

  @override
  void initState() {
    super.initState();
    name = widget.category.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Categoria')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Nome da Categoria'),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ApiService.updateCategory(
                        Category(id: widget.category.id, name: name));
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
