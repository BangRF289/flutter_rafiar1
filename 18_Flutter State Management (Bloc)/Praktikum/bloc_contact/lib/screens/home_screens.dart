import 'package:flutter/material.dart';
import 'package:st_bloc_contact/widget/image_action.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 173, 33, 243),
        title: const Text('GridView'),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromRGBO(221, 152, 255, 1),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/gridview');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 33, 243),
              ),
              child: const Text(
                'Galeri',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/contact');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 173, 33, 243),
              ),
              child: const Text(
                'Contact',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const ImageGridView(),
    );
  }
}
