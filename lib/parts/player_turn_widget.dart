import 'package:connect_4_app/parts/color_box.dart';
import 'package:connect_4_app/parts/text_item.dart';
import 'package:connect_4_app/state/game_logic.dart';
import 'package:flutter/material.dart';

class PlayerTurnWidget extends StatefulWidget {
  const PlayerTurnWidget({Key? key}) : super(key: key);

  @override
  PlayerTurnWidgetState createState() => PlayerTurnWidgetState();
}

class PlayerTurnWidgetState extends State<PlayerTurnWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          ColorBox(selectedPlayer: player, selected: player == 1),
          const SizedBox(width: 10),
          const TextItem(text: 'Player 1'),
          const Spacer(),
          ColorBox(selectedPlayer: player, selected: player == 2),
          const SizedBox(width: 10),
          const TextItem(text: 'Player 2'),
        ],
      ),
    );
  }
}
