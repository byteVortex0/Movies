import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repo.dart';

class GetNowPlayingUsecase extends BaseUsecase<List<Movie>, NoParam> {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingUsecase({required this.baseMovieRepo});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParam param) async {
    return await baseMovieRepo.getNowPlaying();
  }
}
