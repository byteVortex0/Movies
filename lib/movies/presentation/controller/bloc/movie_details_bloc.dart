import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_movie_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetMovieRecommendationUsecase getMovieRecommendationUsecase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getMovieRecommendationUsecase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetails(event, emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParam(movieId: event.id),
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

  FutureOr<void> _getMovieRecommendation(event, emit) async {
    final result = await getMovieRecommendationUsecase(
      MovieRecommendationParam(movieId: event.id),
    );

    result.fold((l) {
      emit(state.copyWith(
        movierecommendationState: RequestState.error,
        movierecommendationMassege: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        movierecommendation: r,
        movierecommendationState: RequestState.loaded,
      ));
    });
  }
}
