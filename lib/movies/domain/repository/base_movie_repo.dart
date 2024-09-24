import 'package:dartz/dartz.dart';
import '../entities/movie_details.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';

abstract class BaseMovieRepo {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(movieId);
}
