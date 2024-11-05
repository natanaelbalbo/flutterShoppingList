import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingapp/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen deve exibir o título e a mensagem de boas-vindas',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Lista de Compras'), findsOneWidget);

    expect(find.text('Bem-vindo à Lista de Compras!'), findsOneWidget);
  });

  testWidgets('Drawer deve conter as opções de navegação',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    expect(find.text('Menu de Navegação'), findsOneWidget);
    expect(find.text('Ver Categorias'), findsOneWidget);
    expect(find.text('Ver Lista de Compras'), findsOneWidget);
    expect(find.text('Adicionar Novo Item'), findsOneWidget);
    expect(find.text('Adicionar Nova Categoria'), findsOneWidget);
  });

  testWidgets(
      'Clica no botão Ver Listas de Compras e navega para a tela correta',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(),
      routes: {
        '/items': (context) =>
            Scaffold(body: Center(child: Text('Lista de Itens'))),
      },
    ));

    await tester.tap(find.text('Ver Listas de Compras'));
    await tester.pumpAndSettle();

    expect(find.text('Lista de Itens'), findsOneWidget);
  });
}
