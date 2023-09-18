import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> contact = {
      "Leanne Graham": "1-770-736-8031 x56442",
      "Ervin Howell": "010-692-6593 x09125",
      "Clementine Bauch": "1-463-123-4447",
      "Patricia Lesback": "493-170-9623-x156",
      "Chelsey Dietrich": "(256)954-1289",
      "Mrs. Dennis Schulist": "1-447-935-8478 x6430",
      "Kurtis Weissnat": "210.067.6132"
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material App"),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text("Home Page")),
            ListTile(title: Text("About Page")),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: contact.length,
        itemBuilder: (context, position) {
          String name = contact.keys.elementAt(position);
          String avatarText = name.substring(0, 1).toUpperCase();
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 36, 182, 13),
                    radius: 30,
                    child: Text(
                      avatarText,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact.keys.elementAt(position),
                        style: const TextStyle(fontSize: 22.0),
                      ),
                      Text(
                        contact.values.elementAt(position),
                        style:
                            const TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ]),
    );
  }
}
