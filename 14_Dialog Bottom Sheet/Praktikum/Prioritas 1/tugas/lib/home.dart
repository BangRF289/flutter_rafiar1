import 'package:flutter/material.dart';
import 'package:tugas/image_action.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
      ),
      body: const ImageGridView(),
    );
  }
}
