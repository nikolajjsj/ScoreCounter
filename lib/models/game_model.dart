import 'package:flutter/material.dart';

class Game {
  final String title;
  final int maxScore;
  final int roundsCount;
  final bool reversedScoring;

  const Game({
    @required this.title,
    this.maxScore,
    this.roundsCount,
    @required this.reversedScoring,
  });
}
