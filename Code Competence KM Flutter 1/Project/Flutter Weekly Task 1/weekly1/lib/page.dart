import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weekly1/home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weekly 1',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Welcome(),
                MyWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
