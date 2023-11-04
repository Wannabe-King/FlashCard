import 'package:flashcard/flash_card.dart';
import 'package:flashcard/flashcard.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Flashcard> list = [
    Flashcard(question: "What is your name?", answer: 'Priryanshu Sidar'),
    Flashcard(question: "What are your hobbies?", answer: "I like bulding app.")
  ];

  int index = 0;

  double elevation = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "FlashCard App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.deepOrangeAccent,
                fontSize: 70,
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: FlipCard(
              front: FlashCardView(text: list[index].question),
              back: FlashCardView(text: list[index].answer),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (index > 0) index--;
                    });
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.white24)),
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Prev')),
              OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (index < list.length - 1) index++;
                    });
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white24),
                  ),
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Next'))
            ],
          )
        ],
      ),
    );
  }
}
