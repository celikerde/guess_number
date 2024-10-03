import 'dart:math';
import 'package:flutter/material.dart';
import 'package:guess_number/show_popup_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String returnedMessage = ""; //Guess number message
  int guessNumber = 0;
  int guessCount = 0; //for calculating score
  int randomNumber = Random().nextInt(100) + 1;
  late TextEditingController _textController;
  List<String> guessedNumbers =
      []; //guess numbers compares to the random number.
  List<String> scoreCounts = []; //locally save scores with Shared Preferences.
  late SharedPreferences sharedPrefs;

  @override
  void initState() {
    _textController = TextEditingController();
    initPrefsAndLoadScores();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void initPrefsAndLoadScores() async {
    sharedPrefs = await SharedPreferences.getInstance();
    scoreCounts = sharedPrefs.getStringList('scores') ?? [];
  }

  void setScores() {
    sharedPrefs.setStringList('scores', scoreCounts);
  }

  void guessedNumberNotInt() {
    //Not Integer input ,so showing pop_up message.
    showPopupMessage(
        title: 'Hata!',
        content: integerErrorMessage,
        buttonText: 'Tamam',
        context: context);
  }

  void guessedIntNumNotInterval() {
    //Integer guess number, but not interval, so showing pop_up message.
    showPopupMessage(
      title: 'Hata!',
      content: intervalErrorMessage,
      buttonText: 'Tamam',
      context: context,
    );
    _textController.clear();
  }

  void guessedSmallNum() {
    returnedMessage = guessBiggerNumberMessage;
    // Random number greater than my guess num.
    guessedNumbers.add(">$guessNumber");
  }

  void guessedBigNum() {
    returnedMessage = guessSmallerNumberMessage;
    // Random number smaller than my guess num.
    guessedNumbers.add("<$guessNumber");
  }

  void correctGuessNum() {
    //With Correct guess, show pop-up message and confetti animation.
    showPopupMessage(
      title: 'Tebrikler!',
      content: "$guessCount tahminde sayıyı buldunuz.",
      buttonText: 'Yeniden Oyna!',
      context: context,
      showConfetti: true,
    );
    scoreCounts.add(guessCount.toString());
    //Score is saved on local device with shared preferences.
    setScores();
    returnedMessage = "";
    randomNumber = Random().nextInt(100) + 1;
    guessCount = 0;
    guessedNumbers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BodyText(),
          GuessNumberInput(textController: _textController),
          GuessMessage(returnedMessage: returnedMessage),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                setState(() {});
                try {
                  guessNumber = int.parse(_textController.text);
                  if (guessNumber <= 0 || guessNumber > 100) {
                    throw Exception();
                  }
                  guessCount++;
                  if (guessNumber < randomNumber) {
                    guessedSmallNum();
                  } else if (guessNumber > randomNumber) {
                    guessedBigNum();
                  } else {
                    correctGuessNum();
                  }
                } on FormatException catch (_) {
                  guessedNumberNotInt();
                } catch (_) {
                  guessedIntNumNotInterval();
                }
                _textController.clear();
              },
              child: const Center(child: Text(buttonMessage)),
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

class GuessMessage extends StatelessWidget {
  const GuessMessage({
    super.key,
    required this.returnedMessage,
  });

  final String returnedMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(returnedMessage),
    );
  }
}

class GuessNumberInput extends StatelessWidget {
  const GuessNumberInput({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _textController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintTextMessage,
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _textController.clear(),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        bodyMessage,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}

const String hintTextMessage = '1-100 arası bir tahminde bulunun.';
const String buttonMessage = 'Tahmin Et!';
const String guessSmallerNumberMessage = 'Daha küçük bir sayı deneyin.';
const String guessBiggerNumberMessage = 'Daha büyük bir sayı deneyin.';
const String intervalErrorMessage = 'Tahmininiz 1 ile 100 arasında olmalıdır.';
const String integerErrorMessage = 'Lütfen tam sayı(1-100) giriniz!';
const bodyMessage = 'Sayı Tahmin Oyunu';
