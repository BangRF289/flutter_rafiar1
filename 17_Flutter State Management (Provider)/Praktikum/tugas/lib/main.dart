import 'package:flutter/material.dart';
import 'package:tugas/contact_screen/contact_screen.dart';
import 'package:provider/provider.dart';
import 'package:tugas/contact_screen/contact_provider.dart'
    // ignore: library_prefixes
    as myContactProvider;

import 'home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => myContactProvider
                .ContactProvider()), // Menggunakan alias myContactProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/gridview': (_) => const HomePage(),
        '/contact': (_) => const Contact(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
