import 'package:connect_4_app/parts/game_over_dialog.dart';
import 'package:flutter/material.dart';
import '../model/coin.dart';
import '../state/game_logic.dart';
import 'game_coin_widget.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    Key? key,
    required this.gameBoardKey,
    required this.playerTurnKey,
  }) : super(key: key);

  final GlobalKey gameBoardKey;
  final GlobalKey playerTurnKey;

  @override
  GameBoardState createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width - 20,
      width: MediaQuery.of(context).size.width - 20,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: gameState.map((row) {
          return Row(
            children: row.map((coin) {
              return InkWell(
                onTap: () async {
                  if (end == false) {
                    await onPlay(
                      coin: Coin(
                        row: coin['row'] as int,
                        column: coin['column'] as int,
                        selected: false,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      playerTurnKey: widget.playerTurnKey,
                      gameBoardKey: widget.gameBoardKey,
                    );
                    Result result = didEnd();
                    if (result != Result.play) {
                      setState(() {});
                      showDialog(
                        context: context,
                        builder: (context) {
                          return GameOverDialog(result: result);
                        },
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Game Over!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                },
                child: GameCoinWidget(
                  coin: (coin['value'] == 0)
                      ? Coin(
                          row: coin['row'] as int,
                          column: coin['column'] as int,
                          selected: false,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        )
                      : (coin['value'] == 1)
                          ? Coin(
                              row: coin['row'] as int,
                              column: coin['column'] as int,
                              selected: true,
                              color: playerOneColor,
                            )
                          : (coin['value'] == 2)
                              ? Coin(
                                  row: coin['row'] as int,
                                  column: coin['column'] as int,
                                  selected: true,
                                  color: playerTwoColor,
                                )
                              : Coin(
                                  row: coin['row'] as int,
                                  column: coin['column'] as int,
                                  selected: true,
                                  color: Colors.red,
                                ),
                  image: (coin['value'] == 0)
                      ? 0
                      : (coin['value'] == 1)
                          ? 1
                          : (coin['value'] == 2)
                              ? 2
                              : 3,
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
