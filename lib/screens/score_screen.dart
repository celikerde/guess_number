import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List<String> myScores = [];
  List<int> myIntScores = []; //parsing to int scores for ordering.
  late SharedPreferences sharedPrefs;

  void initAndLoadScores() async {
    sharedPrefs = await SharedPreferences.getInstance();
    myScores = sharedPrefs.getStringList('scores') ?? [];
    myIntScores = myScores.map(int.parse).toList();
    setState(() {});
    myIntScores.sort();
  }

  @override
  void initState() {
    initAndLoadScores();
    super.initState();
  }

  //for testing, delete all scores.
  void clearAllScores() async {
    myScores = [];
    sharedPrefs.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScores.isNotEmpty
          ? ListView.builder(
              itemCount: myScores.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: ListTile(
                      title: Center(
                          child:
                              Text("Skor : ${myIntScores.elementAt(index)}")),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(noScoreMessage),
            ),
      floatingActionButton: myScores.isNotEmpty
          ? FloatingActionButton(
              child: const Text('Sil'),
              onPressed: () {
                clearAllScores();
              },
            )
          : null,
    );
  }
}

const noScoreMessage = 'Herhangi bir skor yok.';
