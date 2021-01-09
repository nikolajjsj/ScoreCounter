part of 'players_bloc.dart';

abstract class PlayersEvent extends Equatable {
  const PlayersEvent();

  @override
  List<Object> get props => [];
}

class AddPlayer extends PlayersEvent {
  final Player player;

  const AddPlayer(this.player);

  @override
  List<Object> get props => [player];
}

class RemovePlayer extends PlayersEvent {
  final Player player;

  const RemovePlayer(this.player);

  @override
  List<Object> get props => [player];
}
