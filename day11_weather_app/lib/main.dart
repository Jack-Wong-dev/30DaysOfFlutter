import 'package:day11_weather_app/model.dart';
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
  final _textEditingController = TextEditingController();
  final _dataService = DataService();
  WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_response != null)
            Column(
              children: [
                Image.network(_response.iconUrl),
                Text(
                  '${_response.tempInfo.temperature}°',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  _response.weatherInfo.description,
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'City'),
            ),
          ),
          ElevatedButton(onPressed: _searchWeather, child: Text('Get Weather'))
        ],
      ),
    ));
  }

  void _searchWeather() async {
    final response = await _dataService.getWeather(_textEditingController.text);
    setState(() => _response = response);
  }
}
