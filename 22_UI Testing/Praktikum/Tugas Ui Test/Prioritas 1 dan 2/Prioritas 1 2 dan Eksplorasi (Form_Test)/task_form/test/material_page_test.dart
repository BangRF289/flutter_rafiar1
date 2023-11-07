import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prioritas1/material_page.dart';

void main() {
  testWidgets('Test UI of Home Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Home()));

    // Find widgets on the Home page
    final appBarTitle = find.text("Contact");
    final createNewContactText = find.text("Create New Contact");
    final nameFormField = find.widgetWithText(TextFormField, "Name");
    final numberFormField = find.widgetWithText(TextFormField, "Number");
    final submitButton = find.text("Submit");
    final listViewTitle = find.text("List View");

    // Verify that the title is displayed
    expect(appBarTitle, findsOneWidget);

    // Verify that "Create New Contact" text is displayed
    expect(createNewContactText, findsOneWidget);

    // Verify that both Name and Number input fields are present
    expect(nameFormField, findsOneWidget);
    expect(numberFormField, findsOneWidget);

    // Verify that the "Submit" button is present
    expect(submitButton, findsOneWidget);

    // Verify that the "List View" title is displayed
    expect(listViewTitle, findsOneWidget);
  });
}
