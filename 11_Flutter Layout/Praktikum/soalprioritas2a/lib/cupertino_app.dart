import 'package:flutter/cupertino.dart';
import './cupertino_page.dart';

class App extends StatelessWidget {
  const App({super.key});
  final _themedark = const CupertinoThemeData.raw(
      Brightness.dark, null, null, null, null, null, null);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: _themedark,
      home: const HomePage(),
    );
  }
}
