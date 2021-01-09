import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:scoreboard/models/game_model.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends HydratedBloc<GamesEvent, GamesState> {
  GamesBloc() : super(GamesState(games: []));

  @override
  GamesState fromJson(Map<String, dynamic> json) {
    if (json['games'] != null) {
      List<Game> _games = [];
      for (var game in json['games']) _games.add(Game.fromJson(game));
      print(json['games']);
      return GamesState(games: _games);
    }
    return GamesState(games: []);
  }

  @override
  Map<String, dynamic> toJson(GamesState state) {
    return {'games': state.games.map((game) => game.toJson()).toList()};
  }

  @override
  Stream<GamesState> mapEventToState(
    GamesEvent event,
  ) async* {
    final oldState = state;

    if (event is AddGame) {
      yield GamesState(games: []);
      List<Game> _games = oldState.games;
      _games.add(event.game);
      yield GamesState(games: _games);
    } else if (event is RemoveGame) {
      yield GamesState(games: []);
      List<Game> _games = oldState.games;
      _games.remove(event.game);
      yield GamesState(games: _games);
    }
  }
}
