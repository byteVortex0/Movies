import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetTopRatedMoviesUsecase extends BaseUsecase<List<Movie>, NoParam> {
  final BaseMovieRepo baseMovieRepo;

  GetTopRatedMoviesUsecase({required this.baseMovieRepo});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParam param) async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
