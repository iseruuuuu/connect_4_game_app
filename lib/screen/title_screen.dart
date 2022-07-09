import 'package:connect_4_app/parts/title/title_button.dart';
import 'package:connect_4_app/screen/game_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.red,
              Colors.yellow,
            ],
            stops: [0.45, 1],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'CONNECT 4',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            TitleButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameScreen(),
                  ),
                );
              },
              text: '2人で対戦',
              titleColor: Colors.black,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 50),
            TitleButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => GameScreen(),
                //   ),
                // );
              },
              text: '設定',
              titleColor: Colors.black,
              color: Colors.greenAccent,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
