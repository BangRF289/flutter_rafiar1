import 'package:flutter/material.dart';

class DetailImagePage extends StatelessWidget {
  final String imagePath;
  const DetailImagePage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Image'),
      ),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
