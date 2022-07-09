import 'package:connect_4_app/state/game_logic.dart';
import 'package:flutter/material.dart';

class PlayerTurnText extends StatefulWidget {
  const PlayerTurnText({Key? key}) : super(key: key);

  @override
  PlayerTurnTextState createState() => PlayerTurnTextState();
}

class PlayerTurnTextState extends State<PlayerTurnText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        (player == 1) ? 'Player1のターン' : 'Player2のターン',
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
