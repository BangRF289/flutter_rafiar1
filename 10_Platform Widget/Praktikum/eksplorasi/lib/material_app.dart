import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> learn = [
      "Learn Flutter",
      "Learn ReactJS",
      "Learn VueJS",
      "Learn Tailwind CSS",
      "Learn UI/UX",
      "Learn Figma",
      "Learn Digital Marketing"
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF6200EE),
          centerTitle: true,
          title: const Text("My Flutter App"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: ListView.builder(
          itemCount: learn.length,
          itemBuilder: (context, position) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const SizedBox(width: 10), // Spacer antara avatar dan teks
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          learn[position],
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF03DAC5),
            onPressed: () {},
            child: const Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 194, 192, 192),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                color: Color.fromARGB(
                    255, 194, 192, 192), // Atur warna ikon menjadi putih
              ),
              label: 'Information',
            ),
          ],
          backgroundColor: const Color(0xFF6200EE),
          selectedItemColor: Colors.white, // Warna label item yang dipilih
          unselectedItemColor:
              Colors.white, // Warna label item yang tidak dipilih
          selectedLabelStyle: const TextStyle(
              color: Colors.white), // Gaya teks label item yang dipilih
          unselectedLabelStyle: const TextStyle(
              color: Colors.white), // Gaya teks label item yang tidak dipilih
        ),
      ),
    );
  }
}
