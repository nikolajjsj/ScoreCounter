part of 'players_bloc.dart';

class PlayersState extends Equatable {
  final List<Player> players;

  const PlayersState({@required this.players});

  @override
  List<Object> get props => [players];
}
