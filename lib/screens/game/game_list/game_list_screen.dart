import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/screens/game/game_list/bloc/games_bloc.dart';

class GameListScreen extends StatelessWidget {
  static Route route() {
    return CupertinoPageRoute(builder: (context) => GameListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Game list')),
      body: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) => ListView.builder(
          itemCount: state.games.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(state.games[index].title));
          },
        ),
      ),
    );
  }
}
