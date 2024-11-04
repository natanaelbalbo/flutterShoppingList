import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'dart:convert';

import 'package:shoppingapp/services/api_service.dart';
import 'package:shoppingapp/models/item.dart';
import 'package:shoppingapp/models/category.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient client;
  late ApiService apiService;

  setUp(() {
    client = MockClient();
    apiService = ApiService();
  });

  test('getItems retorna uma lista de itens se a chamada http for bem-sucedida',
      () async {
    when(client.get(Uri.parse('http://localhost:3000/items')))
        .thenAnswer((_) async => http.Response('''
        [
          {"_id": "1", "name": "Item 1", "categoryId": "cat1"},
          {"_id": "2", "name": "Item 2", "categoryId": "cat2"}
        ]
        ''', 200));

    final items = await ApiService.getItems();
    expect(items, isA<List<Item>>());
    expect(items.length, 2);
  });

  test(
      'getCategories retorna uma lista de categorias se a chamada http for bem-sucedida',
      () async {
    when(client.get(Uri.parse('http://localhost:3000/categories')))
        .thenAnswer((_) async => http.Response('''
        [
          {"_id": "cat1", "name": "Categoria 1"},
          {"_id": "cat2", "name": "Categoria 2"}
        ]
        ''', 200));

    final categories = await ApiService.getCategories();
    expect(categories, isA<List<Category>>());
    expect(categories.length, 2);
  });

  test('addItem cria um novo item se a chamada http for bem-sucedida',
      () async {
    final item = Item(
        id: '',
        name: 'Item 1',
        categoryId: 'cat1',
        categoryName: 'Categoria 1');

    when(client.post(
      Uri.parse('http://localhost:3000/items'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(
        '{"_id": "1", "name": "Item 1", "categoryId": "cat1"}', 201));

    await ApiService.addItem(item);
  });

  test('updateItem atualiza um item se a chamada http for bem-sucedida',
      () async {
    final item = Item(
        id: '1',
        name: 'Item 1',
        categoryId: 'cat1',
        categoryName: 'Categoria 1');

    when(client.put(
      Uri.parse('http://localhost:3000/items/1'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(
        '{"_id": "1", "name": "Item 1", "categoryId": "cat1"}', 200));

    await ApiService.updateItem(item);
  });

  test('deleteItem remove um item se a chamada http for bem-sucedida',
      () async {
    when(client.delete(Uri.parse('http://localhost:3000/items/1')))
        .thenAnswer((_) async => http.Response('', 204));

    await ApiService.deleteItem('1');
  });
}
