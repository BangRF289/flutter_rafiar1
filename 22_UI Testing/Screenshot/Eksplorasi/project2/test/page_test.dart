import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project2/home_page.dart';
import 'package:project2/page.dart';

void main() {
  testWidgets('Test HomePage UI', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    // Find the AppBar
    final appBar = find.byType(AppBar);

    // Find the leading IconButton with a specific tooltip
    final leadingIconButton = find.byTooltip('Open navigation menu');

    // Find the 'About Us' and 'Alterra Academy Programs' text elements
    final aboutUsText = find.text('About Us');
    final programsText = find.text('Alterra Academy Programs');

    // Find the CustomCard widgets
    final customCards = find.byType(CustomCard);

    // Find the BottomNavigationBar
    final bottomNavigationBar = find.byType(BottomNavigationBar);

    // Expectations
    expect(appBar, findsOneWidget);
    expect(leadingIconButton, findsOneWidget);
    expect(aboutUsText, findsOneWidget);
    expect(programsText, findsOneWidget);
    expect(customCards, findsNWidgets(2)); // Assuming you have 2 CustomCards
    expect(bottomNavigationBar, findsOneWidget);
  });
}
