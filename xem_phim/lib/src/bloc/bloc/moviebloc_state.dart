part of 'moviebloc_bloc.dart';

abstract class MovieblocState extends Equatable {
  const MovieblocState();

  @override
  List<Object> get props => [];
}

class MovieblocInitial extends MovieblocState {}

class MovieLoading extends MovieblocState {}

class MovieLoaded extends MovieblocState {
  final List<Movie> movieList;

  MovieLoaded(this.movieList);
  @override
  List<Object> get props => [movieList];
}

class MovieError extends MovieblocState {}
