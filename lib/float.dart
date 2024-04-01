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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _displayedValue = ''; // Variable to store and display the value

  // Function to update the displayed value
  void updateDisplayedValue(String value) {
    setState(() {
      if (_displayedValue.length < 4) {
        _displayedValue += value;
      }
    });
  }

  // Function to clear the displayed value
  void clearDisplayedValue() {
    setState(() {
      _displayedValue = '';
    });
  }

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
            Text(
              _displayedValue,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Numpad(onValueChanged: updateDisplayedValue),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                clearDisplayedValue();
              },
              child: Icon(Icons.clear),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
    );
  }
}

class Numpad extends StatelessWidget {
  final Function(String) onValueChanged;

  const Numpad({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                onValueChanged('1');
              },
              child: Text('1'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('2');
              },
              child: Text('2'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('3');
              },
              child: Text('3'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                onValueChanged('4');
              },
              child: Text('4'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('5');
              },
              child: Text('5'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('6');
              },
              child: Text('6'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                onValueChanged('7');
              },
              child: Text('7'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('8');
              },
              child: Text('8'),
            ),
            FloatingActionButton(
              onPressed: () {
                onValueChanged('9');
              },
              child: Text('9'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                onValueChanged('0');
              },
              child: Text('0'),
            ),
          ],
        ),
      ],
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text(
          'Next page content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
