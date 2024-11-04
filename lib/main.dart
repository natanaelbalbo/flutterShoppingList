import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/item_list_screen.dart';
import 'screens/item_form_screen.dart';
import 'screens/category_list_screen.dart';
import 'screens/category_form_screen.dart';
import 'screens/item_edit_form_screen.dart';
import 'screens/category_edit_form_screen.dart';
import 'models/item.dart';
import 'models/category.dart';

void main() {
  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeScreen(),
        '/items': (context) => ItemListScreen(),
        '/add-item': (context) => ItemFormScreen(),
        '/categories': (context) => CategoryListScreen(),
        '/add-category': (context) => CategoryFormScreen(),
        '/edit-item': (context) => ItemEditFormScreen(
            item: ModalRoute.of(context)!.settings.arguments as Item),
        '/edit-category': (context) => CategoryEditFormScreen(
            category: ModalRoute.of(context)!.settings.arguments as Category),
      },
    );
  }
}
