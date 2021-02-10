import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 40;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Column(
          children: [
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                style:
                    TextStyle(fontSize: _fontSize, fontWeight: FontWeight.bold),
                maxLines: null,
              ),
            ),
            Slider(
              value: _fontSize,
              onChanged: (newSize) {
                setState(() => _fontSize = newSize);
              },
              min: 30,
              max: 200,
            )
          ],
        )),
      ),
    );
  }
}
