import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/models/player_model.dart';
import 'package:scoreboard/screens/player_list/bloc/players_bloc.dart';
import 'package:scoreboard/widgets/app_textfield.dart';

class PlayerListScreen extends StatelessWidget {
  static Route route() {
    return CupertinoPageRoute(builder: (context) => PlayerListScreen());
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Player list')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            final _controller = TextEditingController();

            return AlertDialog(
              title: Text('Add player'),
              content: AppTextField(
                controller: _controller,
                labelText: 'Player name',
              ),
              actions: [
                FlatButton(
                  child: Text('CANCEL', style: _textTheme.bodyText2),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                FlatButton(
                  child: Text('ADD', style: _textTheme.bodyText2),
                  onPressed: () {
                    BlocProvider.of<PlayersBloc>(context).add(
                      AddPlayer(Player(name: _controller.text)),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        ),
      ),
      body: BlocBuilder<PlayersBloc, PlayersState>(
        builder: (context, state) => ListView.builder(
          itemCount: state.players.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(state.players[index].name));
          },
        ),
      ),
    );
  }
}
