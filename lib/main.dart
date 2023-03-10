import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      numbers.add(counter++);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total clicked",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                // for (var i = 0; i < numbers.length; i++) Text('${numbers[i]}'),
                for (var number in numbers) Text('$number'),
                IconButton(
                  onPressed: onClicked,
                  iconSize: 40,
                  icon: const Icon(Icons.add_box_outlined),
                )
              ],
            ),
          )),
    );
  }
}
