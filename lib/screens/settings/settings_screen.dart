import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/misc/themes/bloc/theme_bloc.dart';
import 'package:scoreboard/widgets/settings_header.dart';
import 'package:scoreboard/widgets/theme_selector.dart';

class SettingsScreen extends StatelessWidget {
  static Route route() {
    return CupertinoPageRoute(builder: (context) => SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingsHeader(title: 'Theming options'),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return SwitchListTile(
                title: Text('Follow system theme', style: _textTheme.bodyText2),
                value: state.followSystem,
                onChanged: (val) => context
                    .read<ThemeBloc>()
                    .add(ChangeTheme(id: state.id, followSystem: val)),
              );
            },
          ),
          const ThemeSelector(),
        ],
      ),
    );
  }
}
