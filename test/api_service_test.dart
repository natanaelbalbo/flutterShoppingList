import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shoppingapp/services/api_service.dart';
import 'package:shoppingapp/models/item.dart';
import 'dart:convert';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  final client = MockHttpClient();
  ApiService.client = client;

  test('getItems retorna uma lista de itens se a chamada HTTP for bem-sucedida',
      () async {
    final mockResponse = jsonEncode([
      {"id": 1, "name": "Item 1"},
      {"id": 2, "name": "Item 2"}
    ]);

    when(() => client.get(Uri.parse('http://localhost:3000/items')))
        .thenAnswer((_) async => http.Response(mockResponse, 200));

    final items = await ApiService.getItems();

    expect(items, isNotEmpty);
    expect(items[0], isA<Item>());
    expect(items[0].name, equals('Item 1'));
    expect(items[1].name, equals('Item 2'));
  });
}
