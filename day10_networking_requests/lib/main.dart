import 'package:flutter/material.dart';
import 'data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dataService = DataService();
  String _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Builder(builder: (_) {
            if (_response != null) {
              return SingleChildScrollView(
                  child: SafeArea(child: Text(_response)));
            } else {
              return ElevatedButton(
                  onPressed: _makeRequest, child: Text('API Call'));
            }
          }),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dataService.makeRequestToAPI();
    setState(() => _response = response);
  }
}
