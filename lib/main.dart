import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Hello Flutter!"),
        ),
        body: const Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }

}