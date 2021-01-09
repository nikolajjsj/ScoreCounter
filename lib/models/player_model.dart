import 'package:flutter/material.dart';

class Player {
  final String name;

  const Player({
    @required this.name,
  });

  Player.fromJson(Map<String, dynamic> json) : name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
