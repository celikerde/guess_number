import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List<String> myScores = [];
  List<String> myRandoms = [];
  List<int> myIntScores = [];

  void loadScores() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    myScores = sharedPrefs.getStringList('scores') ?? [];
    myRandoms = sharedPrefs.getStringList('randoms') ?? [];
    myIntScores = myScores.map(int.parse).toList();
    setState(() {});
    print('My scores is $myScores');
    myIntScores.sort();
    print(myIntScores);
  }

  @override
  void initState() {
    loadScores();

    setState(() {});
    super.initState();
  }

  void clearAllScores() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    myScores = [];
    myRandoms = [];
    sharedPrefs.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
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
                              Text("Score : ${myIntScores.elementAt(index)}")),
                      //trailing:
                      //    Text("Random number : ${myRandoms.elementAt(index)}"),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('Herhangi bir skor yok.'),
            ),
      floatingActionButton: myScores.isNotEmpty
          ? FloatingActionButton(
              child: const Text('Delete'),
              onPressed: () {
                clearAllScores();
              },
            )
          : null,
    );
  }
}
