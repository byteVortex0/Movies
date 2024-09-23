import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlaying;
  final RequestState requestState;
  final String nowPlayingMessage;

  const MoviesState({
    this.nowPlaying = const [],
    this.requestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object?> get props => [
        nowPlaying,
        requestState,
        nowPlayingMessage,
      ];
}
