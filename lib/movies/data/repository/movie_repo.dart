import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/repository/base_movie_repo.dart';
import '../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../datasourse/remote_datasourse.dart';

class MovieRepo extends BaseMovieRepo {
  final BaseRemoteDatasourse baseRemoteDatasourse;

  MovieRepo({required this.baseRemoteDatasourse});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    var result = await baseRemoteDatasourse.getPlayingNow();
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
          ServerFailuer(message: failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    var result = await baseRemoteDatasourse.getPopularMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
          ServerFailuer(message: failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    var result = await baseRemoteDatasourse.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
          ServerFailuer(message: failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(movieId) async {
    var result = await baseRemoteDatasourse.getMovieDetails(movieId);
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
        ServerFailuer(message: failuer.errorMessageModel.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      MovieRecommendationParam movieId) async {
    var results = await baseRemoteDatasourse.getMovieRecommendation(movieId);
    try {
      return Right(results);
    } on ServerExceptions catch (failuer) {
      return Left(
        ServerFailuer(message: failuer.errorMessageModel.statusMessage),
      );
    }
  }
}
