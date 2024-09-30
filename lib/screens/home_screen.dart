import 'dart:math';
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
  String returnedMessage = "";
  final String guessSmallerNumberMessage = 'Daha küçük bir sayı deneyin.';
  final String guessBiggerNumberMessage = 'Daha büyük bir sayı deneyin.';
  final String intervalErrorMessage =
      'Tahmininiz 1 ile 100 arasında olmalıdır.';
  final String integerErrorMessage = 'Lütfen tam sayı(1-100) giriniz!';
  int myGuessNumber = 0;
  int guessCount = 0;
  int randomNumber = Random().nextInt(100) + 1;
  late TextEditingController _textController;
  List<String> guessedNumbers = [];

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Produced number is $randomNumber");

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text('Ana Sayfa'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Sayı Tahmin Oyunu',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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
            padding: const EdgeInsets.all(16),
            child: Text(returnedMessage),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
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
                    returnedMessage = guessBiggerNumberMessage;
                    guessedNumbers.add(">$myGuessNumber");
                  } else if (myGuessNumber > randomNumber) {
                    returnedMessage = guessSmallerNumberMessage;
                    guessedNumbers.add("<$myGuessNumber");
                  } else {
                    showPopupMessage(
                        title: 'Tebrikler!',
                        content: "$guessCount tahminde sayıyı buldunuz.",
                        buttonText: 'Yeniden Oyna!',
                        context: context,
                        showConfetti: true);
                    returnedMessage = "";
                    randomNumber = Random().nextInt(100) + 1;
                    guessCount = 0;
                    guessedNumbers = [];
                  }
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
            padding: const EdgeInsets.all(16),
            child: Text(
                guessedNumbers.isNotEmpty ? guessedNumbers.toString() : ''),
          ),
        ],
      ),
    );
  }
}
