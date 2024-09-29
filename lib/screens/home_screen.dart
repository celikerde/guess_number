import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:guess_number/show_popup_message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String hintTextMessage = '1-100 arası bir tahminde bulunun.';
  final String buttonMessage = 'Tahmin Et!';
  final String guessSmallerNumberMessage = 'Daha küçük bir sayı deneyin.';
  final String guessBiggerNumberMessage = 'Daha büyük bir sayı deneyin.';
  final String intervalErrorMessage =
      'Tahmininiz 1 ile 100 arasında olmalıdır.';
  final String integerErrorMessage = 'Lütfen tam sayı(1-100) giriniz!';
  String guessMessage = "";
  int myGuessNumber = 0;
  int guessCount = 0;
  int randomNumber = Random().nextInt(100) + 1;
  late TextEditingController _textController;
  late ConfettiController confettiController;

  @override
  void initState() {
    _textController = TextEditingController();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    confettiController.dispose();
    super.dispose();
  }

  void showConfetti() {
    confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    print("Produced number is $randomNumber");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Ana Sayfa'),
      ),
      body: Stack(
        children: [
          Column(
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
                    try {
                      myGuessNumber = int.parse(_textController.text);
                      if (myGuessNumber <= 0 || myGuessNumber > 100) {
                        _textController.clear();
                        showPopupMessage(
                          title: 'Hata!',
                          content: intervalErrorMessage,
                          buttonText: 'Tamam',
                          context: context,
                        );
                        return;
                      }
                      guessCount++;
                      _textController.clear();
                      if (myGuessNumber < randomNumber) {
                        guessMessage = guessBiggerNumberMessage;
                      } else if (myGuessNumber > randomNumber) {
                        guessMessage = guessSmallerNumberMessage;
                      } else {
                        confettiController.play();
                        showPopupMessage(
                          title: 'Tebrikler!',
                          content: "$guessCount tahminde sayıyı buldunuz.",
                          buttonText: 'Yeniden Oyna!',
                          context: context,
                        );
                        randomNumber = Random().nextInt(100) + 1;
                        guessCount = 0;
                      }

                      print("$guessCount. My guess is $myGuessNumber");
                      setState(() {});
                    } catch (e) {
                      _textController.clear();
                      showPopupMessage(
                          title: 'Hata!',
                          content: integerErrorMessage,
                          buttonText: 'Tamam',
                          context: context);
                      print(e.toString());
                    }
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
          Center(
            child: ConfettiWidget(
              confettiController: confettiController,
              colors: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.amber,
              ],
            ),
          )
        ],
      ),
    );
  }
}
