import 'package:flutter/material.dart';
import 'package:scoreboard/misc/utils/time_utils.dart';
import 'package:scoreboard/models/game_model.dart';
import 'package:scoreboard/screens/game/play_game/play_game_screen.dart';

class GameCard extends StatelessWidget {
  final Game game;

  const GameCard({
    Key key,
    @required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(PlayGameScreen.route(game: game)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(game.title, style: _textTheme.bodyText2),
                  Text(
                    '${game.players.length} players',
                    style: _textTheme.bodyText1,
                  ),
                ],
              ),
              Text(getDateString(game.date)),
            ],
          ),
        ),
      ),
    );
  }
}
