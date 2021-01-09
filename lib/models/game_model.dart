import 'package:flutter/material.dart';
import 'package:scoreboard/models/player_model.dart';

class Game {
  final String title;
  final int maxScore;
  final int roundsCount;
  final bool reversedScoring;
  final List<Player> players;

  const Game({
    @required this.title,
    this.maxScore,
    this.roundsCount,
    @required this.reversedScoring,
    @required this.players,
  });

  Game.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        maxScore = json['maxScore'],
        roundsCount = json['roundsCount'],
        reversedScoring = json['reversedScoring'],
        players =
            json['players'].map((player) => Player.fromJson(player)).tolist();

  Map<String, dynamic> toJson() => {
        'title': title,
        'maxScore': maxScore,
        'roundsCount': roundsCount,
        'reversedScoring': reversedScoring,
        'players': players.map((player) => player.toJson()).toList(),
      };
}
