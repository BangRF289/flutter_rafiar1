import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_picker/home_page.dart';

// Gantilah dengan sesuai dengan path ke main.dart Anda

void main() {
  testWidgets('UI Test for HomePage', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Interactive Widgets'), findsOneWidget);

    expect(find.text('Date'), findsOneWidget);

    expect(find.text('Color'), findsOneWidget);

    expect(find.text('Pick Files'), findsOneWidget);

    expect(find.text('Select'), findsOneWidget);

    expect(find.text('Pick Color'), findsOneWidget);

    expect(find.text('Pick and Open Files'), findsOneWidget);
  });
}
