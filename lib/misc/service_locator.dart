import 'package:get_it/get_it.dart';
import 'package:scoreboard/misc/message_service/message_service.dart';
import 'package:scoreboard/misc/preferences/preferences.dart';

final GetIt app = GetIt.instance;

// setting the services for the app instance
void setupServiceLocator() {
  app
    ..registerLazySingleton<MessageService>(() => MessageService())
    ..registerLazySingleton<AppPreferences>(() => AppPreferences());
}
