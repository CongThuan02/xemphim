import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xem_phim/src/service/api_service.dart';

import '../../model/movie.dart';

part 'moviebloc_event.dart';
part 'moviebloc_state.dart';

class MovieblocBloc extends Bloc<MovieblocEvent, MovieblocState> {
  MovieblocBloc() : super(MovieblocInitial());

  @override
  Stream<MovieblocState> mapEventToState(MovieblocEvent event) async* {
    if (event is MovieEventStarted) {
      yield* _mapMovieEvenStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieblocState> _mapMovieEvenStateToState(int movieId, String query) async* {
    final service = new ApiService();
    emit(MovieLoading());
    try {
      List<Movie> movieList = [];
      if (movieId == 0) {
        movieList = await service.getNowPlayingMovie();
      }
      emit(MovieLoaded(movieList));
    } on Exception catch (e) {
      emit(MovieError());
    }
  }
}
