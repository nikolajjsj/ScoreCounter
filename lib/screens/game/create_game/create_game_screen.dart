import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/misc/utils/color_utils.dart';
import 'package:scoreboard/models/game_model.dart';
import 'package:scoreboard/models/player_model.dart';
import 'package:scoreboard/screens/game/game_list/bloc/games_bloc.dart';
import 'package:scoreboard/screens/game/play_game/play_game_screen.dart';
import 'package:scoreboard/screens/player_list/bloc/players_bloc.dart';
import 'package:scoreboard/widgets/app_textfield.dart';

class CreateGameScreen extends StatefulWidget {
  static Route route() {
    return CupertinoPageRoute(builder: (context) => CreateGameScreen());
  }

  @override
  _CreateGameScreenState createState() => _CreateGameScreenState();
}

class _CreateGameScreenState extends State<CreateGameScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _scoreController = TextEditingController();
  TextEditingController _roundsController = TextEditingController();
  bool _reversedScoring = false;
  List<bool> _players;

  @override
  void initState() {
    super.initState();
    _players = List.filled(
      BlocProvider.of<PlayersBloc>(context).state.players.length,
      false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _scoreController.dispose();
    _roundsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Create game')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            labelText: 'Title',
            controller: _titleController,
          ),
          AppTextField(
            labelText: 'Max score (optional)',
            controller: _scoreController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          AppTextField(
            labelText: 'Rounds (optional)',
            controller: _roundsController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SwitchListTile(
              title: Text(
                'Reversed scoring',
                style: _textTheme.bodyText2,
              ),
              value: _reversedScoring,
              onChanged: (val) => setState(() => _reversedScoring = val),
            ),
          ),
          const SizedBox(height: 24.0),
          Text('Players', style: _textTheme.headline4),
          const SizedBox(height: 8.0),
          BlocBuilder<PlayersBloc, PlayersState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.players.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.players[index].name),
                          Checkbox(
                            value: _players[index],
                            onChanged: (val) =>
                                setState(() => _players[index] = val),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 42.0),
          RaisedButton(
            child: Icon(
              Icons.check_rounded,
              color: getContrastColor(Theme.of(context).accentColor),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              List<Player> _gamers = [];
              for (int i = 0; i < _players.length; i++) {
                if (_players[i]) {
                  _gamers.add(
                    BlocProvider.of<PlayersBloc>(context).state.players[i],
                  );
                }
              }

              final Game _game = Game(
                title: _titleController.text,
                maxScore: int.tryParse(_scoreController.text) ?? null,
                roundsCount: int.tryParse(_roundsController.text) ?? null,
                reversedScoring: _reversedScoring,
                players: _gamers,
                date: DateTime.now(),
              );

              BlocProvider.of<GamesBloc>(context).add(AddGame(_game));
              Navigator.of(context).pushReplacement(
                PlayGameScreen.route(game: _game),
              );
            },
          ),
        ],
      ),
    );
  }
}
