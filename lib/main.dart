import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Ana Sayfa'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String hintTextMessage = '1-100 arası bir tahminde bulunun.';
  final String buttonMessage = 'Tahmin et!';
  final String guessSmallerNumberMessage = 'Daha küçük bir sayı deneyin.';
  final String guessBiggerNumberMessage = 'Daha büyük bir sayı deneyin.';
  final String correctGuessMessage = 'Tebrikler! Doğru tahminde bulundunuz.';
  final String errorMessage = 'Tahmininiz 1 ile 100 arasında olmalıdır.';
  String guessMessage = "";
  int myGuessNumber = 0;
  int guessCount = 0;
  late final int randomNumber;
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    randomNumber = Random().nextInt(100) + 1;
    print("Produced number is $randomNumber");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: hintTextMessage,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => _textController.clear(),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                myGuessNumber = int.parse(_textController.text);
                guessCount++;
                if (myGuessNumber < randomNumber) {
                  guessMessage = guessBiggerNumberMessage;
                } else if (myGuessNumber > randomNumber) {
                  guessMessage = guessSmallerNumberMessage;
                } else {
                  guessMessage = correctGuessMessage;
                  print('Guess count is $guessCount is $myGuessNumber');
                }
                print("$guessCount. My guess is $myGuessNumber");
                setState(() {});
              },
              child: Center(child: Text(buttonMessage)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(guessMessage),
          ),
        ],
      ),
    );
  }
}
