import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:scoreboard/models/player_model.dart';

part 'players_event.dart';
part 'players_state.dart';

class PlayersBloc extends HydratedBloc<PlayersEvent, PlayersState> {
  PlayersBloc() : super(PlayersState(players: []));

  @override
  PlayersState fromJson(Map<String, dynamic> json) {
    if (json['players'] != null) {
      List<Player> _players = [];
      for (var player in json['players']) _players.add(Player.fromJson(player));
      return PlayersState(players: _players);
    }
    return PlayersState(players: []);
  }

  @override
  Map<String, dynamic> toJson(PlayersState state) {
    return {'players': state.players.map((player) => player.toJson()).toList()};
  }

  @override
  Stream<PlayersState> mapEventToState(
    PlayersEvent event,
  ) async* {
    final oldState = state;

    if (event is AddPlayer) {
      yield PlayersState(players: []);
      List<Player> _players = oldState.players;
      _players.add(event.player);
      yield PlayersState(players: _players);
    } else if (event is RemovePlayer) {
      yield PlayersState(players: []);
      List<Player> _players = oldState.players;
      _players.remove(event.player);
      yield PlayersState(players: _players);
    }
  }
}
