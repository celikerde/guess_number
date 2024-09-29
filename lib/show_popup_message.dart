import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

showPopupMessage({
  required String title,
  required String content,
  required String buttonText,
  required BuildContext context,
  bool showConfetti = false,
}) {
  ConfettiController? _confettiController;
  if (showConfetti) {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }
  Widget okButton = TextButton(
    child: Text(buttonText),
    onPressed: () {
      Navigator.pop(context);
      _confettiController?.dispose();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          alert,
          if (showConfetti && _confettiController != null)
            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [Colors.blue, Colors.green, Colors.pink, Colors.orange],
            )
        ],
      );
    },
  );
}
