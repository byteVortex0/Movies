import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetPopularMoviesUsecase {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUsecase({required this.baseMovieRepo});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
