import 'package:flutter/material.dart';
import 'package:flutter_learning_clone_coding_toonflix/screens/home_screen.dart';

void main() {
  // ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
