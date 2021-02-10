import 'package:day04_flashcards/flashcard.dart';
import 'package:day04_flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FlashCard> _flashcards = [
    FlashCard("What programming language does Flutter use?", "Dart"),
    FlashCard(
        "Who says the catchphrase 'Wubba Lubba Dub Dub'?", "Rick Sanchez"),
    FlashCard("Who you gonna call?", "Ghostbusters!"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(
                    text: _flashcards[_currentIndex].question,
                  ),
                  back: FlashcardView(
                    text: _flashcards[_currentIndex].answer,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                      onPressed: showPreviousCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlineButton.icon(
                      onPressed: showNextCard,
                      icon: Icon(Icons.chevron_right),
                      label: Text('Next')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex < _flashcards.length - 1 ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          _currentIndex > 0 ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
