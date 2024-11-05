import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/item.dart';
import '../models/category.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000';
  static http.Client client = http.Client();

  static Future<List<Item>> getItems() async {
    final response = await client.get(Uri.parse('$baseUrl/items'));
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return List<Item>.from(json.map((item) => Item.fromJson(item)));
    } else {
      throw Exception('Erro ao carregar os itens');
    }
  }

  static Future<List<Category>> getCategories() async {
    final response = await client.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      Iterable json = jsonDecode(response.body);
      return List<Category>.from(json.map((cat) => Category.fromJson(cat)));
    } else {
      throw Exception('Erro ao carregar as categorias');
    }
  }

  static Future<void> addItem(Item item) async {
    final response = await client.post(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao adicionar o item');
    }
  }

  static Future<void> addCategory(Category category) async {
    final response = await client.post(
      Uri.parse('$baseUrl/categories'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(category.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Erro ao adicionar a categoria');
    }
  }

  static Future<void> deleteItem(String id) async {
    final response = await client.delete(Uri.parse('$baseUrl/items/$id'));
    if (response.statusCode != 204) {
      throw Exception('Erro ao excluir o item');
    }
  }

  static Future<void> deleteCategory(String id) async {
    final response = await client.delete(Uri.parse('$baseUrl/categories/$id'));
    if (response.statusCode != 204) {
      throw Exception('Erro ao excluir a categoria');
    }
  }

  static Future<void> updateCategory(Category category) async {
    final response = await client.put(
      Uri.parse('$baseUrl/categories/${category.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(category.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar a categoria');
    }
  }

  static Future<void> updateItem(Item item) async {
    final response = await client.put(
      Uri.parse('$baseUrl/items/${item.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(item.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Erro ao atualizar o item');
    }
  }
}
