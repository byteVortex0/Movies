import 'package:dartz/dartz.dart';
import '../usecases/get_movie_recommendation_usecase.dart';
import '../entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/recommendation.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParam movieId);
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      MovieRecommendationParam movieId);
}
