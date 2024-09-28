import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text('Ana Sayfa'),
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
                  icon: const Icon(Icons.clear),
                  onPressed: () => _textController.clear(),
                ),
                border: const OutlineInputBorder(),
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
