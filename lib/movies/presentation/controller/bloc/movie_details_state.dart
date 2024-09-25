part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMassege = '',
    this.movierecommendation = const [],
    this.movierecommendationState = RequestState.loading,
    this.movierecommendationMassege = '',
  });

  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMassege;
  final List<Recommendation> movierecommendation;
  final RequestState movierecommendationState;
  final String movierecommendationMassege;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMassege,
    List<Recommendation>? movierecommendation,
    RequestState? movierecommendationState,
    String? movierecommendationMassege,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsRequestState:
            movieDetailsRequestState ?? this.movieDetailsRequestState,
        movieDetailsMassege: movieDetailsMassege ?? this.movieDetailsMassege,
        movierecommendation: movierecommendation ?? this.movierecommendation,
        movierecommendationState:
            movierecommendationState ?? this.movierecommendationState,
        movierecommendationMassege:
            movierecommendationMassege ?? this.movierecommendationMassege,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsRequestState,
        movieDetailsMassege,
        movierecommendation,
        movierecommendationState,
        movierecommendationMassege,
      ];
}
