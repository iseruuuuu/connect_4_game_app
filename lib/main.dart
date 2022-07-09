import 'package:connect_4_app/screen/title_screen.dart';
import 'package:flutter/material.dart';
import 'screen/game_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //まるの色設定
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          //ボードの背景色
          // backgroundColor: Colors.orange,
          centerTitle: true,
        ),
      ),
      // home: GameScreen(),
      home: const TitleScreen(),
    );
  }
}
