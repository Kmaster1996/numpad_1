import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Display Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Numpad(),
          ],
        ),
      ),
    );
  }
}

class Numpad extends StatefulWidget {
  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    // Shuffle the list of numbers
    numbers.shuffle();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < 3; i++)
              FloatingActionButton(
                onPressed: () {
                  // Call a function to handle button press
                  (numbers[i]);
                },
                child: Text(numbers[i].toString()),
              ),
          ],
        ),
        SizedBox(
          height: 20,
          width: 80,
        ), // Add vertical space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 3; i < 6; i++)
              FloatingActionButton(
                onPressed: () {
                  // Call a function to handle button press
                  (numbers[i]);
                },
                child: Text(numbers[i].toString()),
              ),
          ],
        ),
        SizedBox(height: 20), // Add vertical space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 6; i < 9; i++)
              FloatingActionButton(
                onPressed: () {
                  // Call a function to handle button press
                  (numbers[i]);
                },
                child: Text(numbers[i].toString()),
              ),
          ],
        ),
        SizedBox(
          height: 20,
        ), // Add vertical space between rows
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                // Call a function to handle button press
                (numbers[9]);
              },
              child: Text(numbers[9].toString()),
            ),
          ],
        ),
      ],
    );
  }

  void _handleButtonPress(int value) {
    // Handle button press
    print('Pressed $value');
  }
}
