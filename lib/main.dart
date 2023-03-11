import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/screens/homeScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xffe7626c),
        textTheme: const TextTheme(
            headline1: TextStyle(
          color: Color(0xFF232B55),
        )),
        cardColor: const Color((0xFFF4EDDB)),
      ),
      home: const HomeScreen(),
    );
  }
}
