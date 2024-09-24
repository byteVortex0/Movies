import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/enums.dart';
import 'movies_event.dart';
import 'movies_state.dart';

import '../../domain/usecases/get_now_playing_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  MoviesBloc(this.getNowPlayingUsecase) : super(const MoviesState()) {
    on<GetNowPlaying>((event, emit) async {
      final result = await getNowPlayingUsecase.execute();
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
