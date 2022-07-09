import 'package:connect_4_app/parts/player_turn_text.dart';
import 'package:flutter/material.dart';
import '../parts/game_board.dart';
import '../parts/player_turn_widget.dart';
import '../state/game_logic.dart';

class GameScreen extends StatelessWidget {
  GameScreen({super.key});

  GlobalKey<GameBoardState> gameBoardKey = GlobalKey<GameBoardState>();
  GlobalKey<PlayerTurnWidgetState> playerTurnKey =
      GlobalKey<PlayerTurnWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
      ),
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              width: MediaQuery.of(context).size.width,
            ),
            GameBoard(
              key: gameBoardKey,
              playerTurnKey: playerTurnKey,
              gameBoardKey: gameBoardKey,
            ),
            Positioned(
              top: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          AppBar().preferredSize.height) /
                      2 -
                  (MediaQuery.of(context).size.width - 20) / 2 -
                  50,
              child: PlayerTurnWidget(key: playerTurnKey),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const PlayerTurnText(),
          const Spacer(),
          Tooltip(
            message: 'Restart game',
            child: InkWell(
              onTap: () {
                onRestart(
                  gameBoardKey: gameBoardKey,
                  playerTurnKey: playerTurnKey,
                  context: context,
                );
              },
              child: Container(
                width: 130,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Restart',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
