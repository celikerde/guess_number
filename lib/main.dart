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
  List<String> appbarTitles = ['Ana Sayfa', 'Skor Sayfası'];
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          centerTitle: true,
          title: Text(appbarTitles[currentScreenIndex]),
        ),
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
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.score),
              label: 'Skorlar',
            )
          ],
        ),
        body: screens[currentScreenIndex],
      ),
    );
  }
}
