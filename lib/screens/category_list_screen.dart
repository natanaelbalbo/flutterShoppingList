import 'package:flutter/material.dart';
import '../models/category.dart';
import '../services/api_service.dart';
import '../components/category_tile.dart';

class CategoryListScreen extends StatefulWidget {
  @override
  _CategoryListScreenState createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  late Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    categories = ApiService.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categorias')),
      body: FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar as categorias'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma categoria encontrada'));
          } else {
            return ListView(
              children: snapshot.data!
                  .map((category) => CategoryTile(
                      category: category,
                      onDelete: () {
                        setState(() {
                          categories = ApiService.getCategories();
                        });
                      }))
                  .toList(),
            );
          }
        },
      ),
    );
  }
}
