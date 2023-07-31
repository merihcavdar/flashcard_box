import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'flashcard_view.dart';
import 'flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<FlashCard> _flashcards = [
    FlashCard(question: 'Schach', answer: 'chess'),
    FlashCard(question: 'Herausforderung', answer: 'challenge'),
    FlashCard(question: 'Geschwindigkeit', answer: 'speed'),
    FlashCard(question: 'Armbanduhr', answer: 'watch'),
    FlashCard(question: 'Himmel', answer: 'sky'),
    FlashCard(question: 'Tisch', answer: 'table'),
    FlashCard(question: 'Gesundheit', answer: 'health'),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlashCard Box'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 250,
                child: FlipCard(
                  front: FlashCardView(
                    text: _flashcards[_currentIndex].question,
                    iconFlag: Image.asset('assets/images/germany.png'),
                  ),
                  back: FlashCardView(
                    text: _flashcards[_currentIndex].answer,
                    iconFlag: Image.asset('assets/images/united-states.png'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 12.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: const Icon(Icons.chevron_left),
                    label: const Text('vorherige'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(Icons.chevron_right),
                    label: const Text('nächste'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex < (_flashcards.length - 1) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          _currentIndex > 0 ? _currentIndex - 1 : (_flashcards.length - 1);
    });
  }
}
