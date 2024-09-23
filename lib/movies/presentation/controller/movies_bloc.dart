import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import 'movies_event.dart';
import 'movies_state.dart';

import '../../data/datasourse/remote_datasourse.dart';
import '../../data/repository/movie_repo.dart';
import '../../domain/repository/base_movie_repo.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesState()) {
    on<GetNowPlaying>((event, emit) async {
      BaseRemoteDatasourse baseRemoteDatasourse = RemoteDatasourse();
      BaseMovieRepo baseMovieRepo =
          MovieRepo(baseRemoteDatasourse: baseRemoteDatasourse);
      final result =
          await GetNowPlayingUsecase(baseMovieRepo: baseMovieRepo).execute();
      result.fold((l) {
        emit(MoviesState(
          requestState: RequestState.error,
          nowPlayingMessage: l.message,
        ));
      }, (r) {
        emit(MoviesState(
          nowPlaying: r,
          requestState: RequestState.loaded,
        ));
      });
    });

    on<GetPopulerMovies>(
      (event, emit) {},
    );
  }
}
