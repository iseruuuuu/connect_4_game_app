import 'package:flutter/material.dart';
import '../model/coin.dart';

class GameCoinWidget extends StatelessWidget {
  GameCoinWidget({
    super.key,
    required this.coin,
    required this.image,
  });

  final Coin coin;
  final int image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.width - 20) / 7,
      width: (MediaQuery.of(context).size.width - 20) / 7,
      color: Theme.of(context).appBarTheme.backgroundColor,
      alignment: Alignment.center,
      child: Container(
        height: (MediaQuery.of(context).size.width - 20) / 7,
        width: (MediaQuery.of(context).size.width - 20) / 7,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: coin.color,
        ),
        child: (image == 0)
            ? Container()
            : (image == 1)
                ? Image.asset('assets/images/ball1.png')
                : (image == 2)
                    ? Image.asset('assets/images/ball2.png')
                    : Container(),
      ),
    );
  }
}
