import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/error/failure.dart';
import 'package:movies/movies/data/datasourse/remote_datasourse.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/repository/base_movie_repo.dart';

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
    var result = await baseRemoteDatasourse.getPlayingNow();
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
          ServerFailuer(message: failuer.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    var result = await baseRemoteDatasourse.getPlayingNow();
    try {
      return Right(result);
    } on ServerExceptions catch (failuer) {
      return Left(
          ServerFailuer(message: failuer.errorMessageModel.statusMessage));
    }
  }
}
