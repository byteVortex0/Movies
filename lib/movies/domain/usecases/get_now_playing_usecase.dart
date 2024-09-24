import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetNowPlayingUsecase extends BaseUsecase<List<Movie>> {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingUsecase({required this.baseMovieRepo});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepo.getNowPlaying();
  }
}
