import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/misc/themes/bloc/theme_bloc.dart';
import 'package:scoreboard/screens/game/game_list/bloc/games_bloc.dart';
import 'package:scoreboard/screens/player_list/bloc/players_bloc.dart';

class GlobalBloc extends StatelessWidget {
  final Widget child;

  const GlobalBloc({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<GamesBloc>(create: (context) => GamesBloc()),
        BlocProvider<PlayersBloc>(create: (context) => PlayersBloc()),
      ],
      child: child,
    );
  }
}
