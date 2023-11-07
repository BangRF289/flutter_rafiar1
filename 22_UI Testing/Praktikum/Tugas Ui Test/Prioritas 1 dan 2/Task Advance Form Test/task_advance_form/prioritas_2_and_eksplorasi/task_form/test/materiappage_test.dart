import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas1/material_page.dart';

void main() {
  testWidgets('UI Test for Home Page', (WidgetTester tester) async {
    // Build the widget tree
    await tester.pumpWidget(const MaterialApp(
      home: Home(),
    ));

    // Verify the title on the app bar
    expect(find.text('Contact'), findsOneWidget);

    // Verify the "Create New Contact" text
    expect(find.text('Create New Contact'), findsOneWidget);

    // Verify the "Please enter name and telephone number..." text
    expect(
        find.text(
            'Please enter name and telephone number to create a new contact.'),
        findsOneWidget);

    // Verify the Name and Number input fields
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Number'), findsOneWidget);

    // Verify the "Submit" button
    expect(find.text('Submit'), findsOneWidget);

    // Verify the "List View" text
    expect(find.text('List View'), findsOneWidget);

    // Verify the Icon
    expect(find.byIcon(Icons.phone_android), findsOneWidget);

    // Verify the color picker
    expect(find.text('Color'), findsOneWidget);
    expect(find.text('Pick Color'), findsOneWidget);

    // Verify the date picker
    expect(find.text('Date'), findsOneWidget);
    expect(find.text('Select'), findsOneWidget);

    // Verify the "Pick Files" text
    expect(find.text('Pick Files'), findsOneWidget);
    expect(find.text('Pick and Open Files'), findsOneWidget);
  });
}
