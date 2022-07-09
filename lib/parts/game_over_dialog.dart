import 'package:flutter/material.dart';
import '../state/game_logic.dart';

class GameOverDialog extends StatelessWidget {
  const GameOverDialog({
    Key? key,
    required this.result,
  }) : super(key: key);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: (result == Result.draw)
      //     ? Colors.white.withOpacity(0.9)
      //     : (result == Result.player1)
      //         ? playerOneColor.withOpacity(0.9)
      //         : playerTwoColor.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Text(
        (result == Result.draw)
            ? 'It\'s a tie'
            : (result == Result.player1)
                ? 'Player 1 の勝ち'
                : 'Player 2 の勝ち',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      title: const Center(
        child: Text(
          'GAME OVER!',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.black,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
