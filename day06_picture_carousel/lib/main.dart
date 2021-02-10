import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _imagePaths = [
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.png',
    'images/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: _imagePaths.map((imagePath) {
                return Builder(builder: (context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      child: Image.asset(imagePath));
                });
              }).toList()),
        ),
      ),
    );
  }
}
