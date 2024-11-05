import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shoppingapp/screens/item_form_screen.dart';

void main() {
  testWidgets('deve mostrar erro quando o nome do item não é preenchido',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ItemFormScreen(),
      ),
    );

    await tester.tap(find.text('Adicionar'));
    await tester.pump();

    expect(find.text('Por favor, insira um nome'), findsOneWidget);
  });

  testWidgets(
      'deve manter o botão de adicionar visível após preencher o formulário',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ItemFormScreen(),
      ),
    );

    await tester.enterText(find.byType(TextFormField), 'Item Teste');
    await tester.pump();

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
