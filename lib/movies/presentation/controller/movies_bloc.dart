import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../../core/utils/enums.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MoviesBloc(
    this.getNowPlayingUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_nowPlaying);

    on<GetPopularMoviesEvent>(_popular);

    on<GetTopRatedMoviesEvent>(_topRated);
  }

  FutureOr<void> _nowPlaying(event, emit) async {
    final result = await getNowPlayingUsecase();
    result.fold((l) {
      emit(state.copyWith(
        nowPlayingRequestState: RequestState.error,
        nowPlayingMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingRequestState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _popular(event, emit) async {
    final result = await getPopularMoviesUsecase();
    result.fold((l) {
      emit(state.copyWith(
        popularRequestState: RequestState.error,
        popularMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        popularMovies: r,
        popularRequestState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _topRated(event, emit) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold((l) {
      emit(state.copyWith(
        topRatedRequestState: RequestState.error,
        topRatedMessage: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        topRatedMovies: r,
        topRatedRequestState: RequestState.loaded,
      ));
    });
  }
}
