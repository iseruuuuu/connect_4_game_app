import 'package:connect_4_app/state/game_logic.dart';
import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  const ColorBox({
    Key? key,
    required this.selected,
    required this.selectedPlayer,
  }) : super(key: key);

  final bool selected;
  final int selectedPlayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Image.asset(
        !selected ? 'assets/images/ball1.png' : 'assets/images/ball2.png',
      ),
    );
  }
}
