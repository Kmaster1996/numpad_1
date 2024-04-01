import 'package:flutter/material.dart';
import 'package:numpad_kkn2/page2.dart';

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

class PasswordPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
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
      if (_displayedValue == '1234') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page2()),
        );
      } else {
        print('sorry');
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
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayedValue,
              style: TextStyle(fontSize: 34),
            ),
            SizedBox(height: 20),
            Numpad(onValueChanged: updateDisplayedValue),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                clearDisplayedValue();
              },
              child: Text('Clear'),
            ),
            SizedBox(height: 20),
            /*ElevatedButton(
              onPressed: () {
                if (_displayedValue == '123456') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page2()),
                  );
                } else {
                  print('sorry');
                }
              },
              child: Text('Next Page'),
            ),*/
          ],
        ));
  }
}

class Numpad extends StatefulWidget {
  final Function(String) onValueChanged;

  const Numpad({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    numbers.shuffle();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 3; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onValueChanged(numbers[i].toString());
                    },
                    child: Text(numbers[i].toString()),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 3; i < 6; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onValueChanged(numbers[i].toString());
                    },
                    child: Text(numbers[i].toString()),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 6; i < 9; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onValueChanged(numbers[i].toString());
                    },
                    child: Text(numbers[i].toString()),
                  ),
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                widget.onValueChanged(numbers[9].toString());
              },
              child: Text(numbers[9].toString()),
            ),
          ],
        ),
      ],
    );
  }
}
