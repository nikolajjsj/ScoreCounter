import 'package:flutter/material.dart';
import 'package:scoreboard/screens/settings/settings_screen.dart';
import 'package:scoreboard/widgets/card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score Counter'),
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
            color: Colors.red,
          ),
          CardWidget(
            title: 'GAME LIST',
            color: Colors.purple,
          ),
          CardWidget(
            title: 'PLAYER LIST',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
