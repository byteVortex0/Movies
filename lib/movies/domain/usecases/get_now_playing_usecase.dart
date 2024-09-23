import 'package:dartz/dartz.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingUsecase {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingUsecase({required this.baseMovieRepo});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getNowPlaying();
  }
}
