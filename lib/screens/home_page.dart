import 'package:flutter/material.dart';
import 'package:scoreboard/screens/game/create_game/create_game_screen.dart';
import 'package:scoreboard/screens/game/game_list/game_list_screen.dart';
import 'package:scoreboard/screens/player_list/player_list_screen.dart';
import 'package:scoreboard/screens/settings/settings_screen.dart';
import 'package:scoreboard/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score counter'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings_rounded),
            onPressed: () => Navigator.of(context).push(SettingsScreen.route()),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardWidget(
            title: 'CREATE A NEW GAME',
            color: Colors.green[600],
            onTap: () => Navigator.of(context).push(CreateGameScreen.route()),
          ),
          CardWidget(
            title: 'GAME LIST',
            color: Colors.red[600],
            onTap: () => Navigator.of(context).push(GameListScreen.route()),
          ),
          CardWidget(
            title: 'PLAYER LIST',
            color: Colors.blue[600],
            onTap: () => Navigator.of(context).push(PlayerListScreen.route()),
          ),
        ],
      ),
    );
  }
}
