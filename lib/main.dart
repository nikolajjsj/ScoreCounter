import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:scoreboard/misc/message_service/message_widget.dart';
import 'package:scoreboard/misc/preferences/preferences.dart';
import 'package:scoreboard/misc/service_locator.dart';
import 'package:scoreboard/misc/themes/bloc/theme_bloc.dart';
import 'package:scoreboard/misc/themes/default_themes.dart';
import 'package:scoreboard/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await hydrated bloc storage
  HydratedBloc.storage = await HydratedStorage.build();

  // setup Get_it and SharedPreferences
  setupServiceLocator();
  await app<AppPreferences>().initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          final lightTheme = predefinedThemes[1].data;
          final darkTheme = predefinedThemes[2].data;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.followSystem ? lightTheme : state.themeData,
            darkTheme: state.followSystem ? darkTheme : state.themeData,
            themeMode: state.followSystem ? ThemeMode.system : ThemeMode.light,
            title: 'Score Counter',
            home: const HomeScreen(),
            builder: (context, child) => MessageWidget(child: child),
          );
        },
      ),
    );
  }
}
