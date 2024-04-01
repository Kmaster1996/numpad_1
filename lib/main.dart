import 'package:flutter/material.dart';
import 'package:numpad_kkn2/page2.dart';

void main() {
  runApp(Numpad());
}

class Numpad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KKNNumpad1(),
    );
  }
}

class KKNNumpad1 extends StatefulWidget {
  final Color color;
  final double size;

  const KKNNumpad1({
    Key? key,
    this.color = Colors.blue, // Default color
    this.size = 50.0, // Default size
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: color,
    );
  }

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<KKNNumpad1> {
  String _displayedValue = ''; // Variable to store and display the value
  // Function to update the displayed value
  int loginAttempts = 0;
  final int maxLoginAttempts = 4;
  void updateDisplayedValue(String value) {
    setState(() {
      if (_displayedValue.length < 4) {
        _displayedValue += value;
      }
      if (_displayedValue == "1234") {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return page2();
            },
          ),
        );
      } else {
        loginAttempts++;
      }
      if (loginAttempts >= maxLoginAttempts) {
        // Handle the case when the maximum login attempts are reached
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: Text('Login Blocked')),
              content: Text(
                "Your Password is Not correct\nPress 'Clear' for  try again",
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }

  // Function to clear the displayed value
  void clearDisplayedValue() {
    setState(() {
      _displayedValue = '';
      loginAttempts = 0;
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
            Numpadctl(onValueChanged: updateDisplayedValue),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                clearDisplayedValue();
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text('Clear'),
            ),
            SizedBox(height: 20),
          ],
        ));
  }
}

class Numpadctl extends StatefulWidget {
  final Function(String) onValueChanged;

  const Numpadctl({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  State<Numpadctl> createState() => _NumpadState();
}

class _NumpadState extends State<Numpadctl> {
  List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  Widget build(BuildContext context) {
    numbers.shuffle();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          widget.onValueChanged(numbers[i].toString());
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        child: Text(numbers[i].toString()),
                      ),
                    ),
                  ),
              ],
            ),
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
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onValueChanged(numbers[i].toString());
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text(numbers[i].toString()),
                    ),
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
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onValueChanged(numbers[i].toString());
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: Text(numbers[i].toString()),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.onValueChanged(numbers[9].toString());
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Text(numbers[9].toString()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
