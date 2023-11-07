import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project2/home_page.dart';

void main() {
  testWidgets('UI Test for Welcome Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Welcome(),
    ));

    final titleFinder = find.text(
        'Coding Bootcamp Penghasil Programmer dengan Kualitas Tinggi Di Indonesia');
    final bodyTextFinder = find.text(
        'Alterra Academy adalah coding bootcamp indonesia untuk semua orang, baik dengan background IT & Non-IT untuk menjadi Programmer dengan kualitas terbaik di Industri saat ini.');
    final learnMoreButtonFinder = find.text('Pelajari Lebih Lanjut');

    expect(titleFinder, findsOneWidget);
    expect(bodyTextFinder, findsOneWidget);
    expect(learnMoreButtonFinder, findsOneWidget);
  });
}
