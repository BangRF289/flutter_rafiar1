import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:st_bloc_contact/bloc/contact_bloc.dart';
import 'package:st_bloc_contact/screens/contact_screens.dart';
import 'package:st_bloc_contact/screens/home_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactBloc(), // Inisialisasi ContactBloc
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/gridview',
        routes: {
          '/gridview': (_) => const HomePage(),
          '/contact': (_) => const MyHomePage(),
        },
        title: 'Alta - Flutter BloC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
