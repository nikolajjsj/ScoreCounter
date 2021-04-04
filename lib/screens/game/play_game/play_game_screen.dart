import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoreboard/models/game_model.dart';
import 'package:scoreboard/widgets/name_card.dart';

class PlayGameScreen extends StatelessWidget {
  static Route route({@required Game game}) {
    return CupertinoPageRoute(builder: (context) => PlayGameScreen(game: game));
  }

  final Game game;

  const PlayGameScreen({
    Key key,
    @required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(game.title)),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: game.players
                  .map((player) => NameCard(title: player.name))
                  .toList(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: game.players
                  .map((player) => NameCard(title: player.name))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
