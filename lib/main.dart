import 'package:flutter/material.dart';
import 'package:guess_number/screens/home_screen.dart';
import 'package:guess_number/screens/score_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentScreenIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ScoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amber,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentScreenIndex,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              currentScreenIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.score),
              label: 'Scores',
            )
          ],
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
