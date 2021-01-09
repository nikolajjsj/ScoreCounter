part of 'games_bloc.dart';

class GamesState extends Equatable {
  final List<Game> games;

  const GamesState({@required this.games});

  @override
  List<Object> get props => [games];
}
