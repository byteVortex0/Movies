import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(event, emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParam(movieId: event.movieId),
    );
    result.fold((l) {
      emit(state.copyWith(
        movieDetailsRequestState: RequestState.error,
        movieDetailsMassege: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        movieDetails: r,
        movieDetailsRequestState: RequestState.loaded,
      ));
    });
  }
}
