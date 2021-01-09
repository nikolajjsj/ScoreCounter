part of 'games_bloc.dart';

abstract class GamesEvent extends Equatable {
  const GamesEvent();

  @override
  List<Object> get props => [];
}

class AddGame extends GamesEvent {
  final Game game;

  const AddGame(this.game);

  @override
  List<Object> get props => [game];
}

class RemoveGame extends GamesEvent {
  final Game game;

  const RemoveGame(this.game);

  @override
  List<Object> get props => [game];
}
