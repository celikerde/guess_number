import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void showPopupMessage({
  required String title,
  required String content,
  required String buttonText,
  required BuildContext context,
  bool showConfetti = false,
}) {
  ConfettiController? confettiController;
  if (showConfetti) {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    confettiController.play();
  }
  Widget okButton = Center(
    child: TextButton(
      child: Text(buttonText),
      onPressed: () {
        Navigator.pop(context);
        confettiController?.dispose();
      },
    ),
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
    barrierDismissible: false, // Alert dialog button must be clicked.
    builder: (BuildContext context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          PopScope(
            canPop:
                false, // Anymore with back button cannot ignore alert dialog.
            child: alert,
          ),
          if (showConfetti && confettiController != null)
            ConfettiWidget(
              confettiController: confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: const [
                Colors.blue,
                Colors.green,
                Colors.pink,
                Colors.orange
              ],
            )
        ],
      );
    },
  );
}
