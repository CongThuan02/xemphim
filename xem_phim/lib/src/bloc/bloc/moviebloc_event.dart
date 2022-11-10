part of 'moviebloc_bloc.dart';

abstract class MovieblocEvent extends Equatable {
  const MovieblocEvent();

  @override
  List<Object> get props => [];
}

class MovieEventStarted extends MovieblocEvent {
  final int movieId;
  final String query;

  MovieEventStarted(this.movieId, this.query);
  @override
  List<Object> get props => [];
}
