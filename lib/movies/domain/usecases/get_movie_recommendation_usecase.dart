import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/recommendation.dart';
import '../repository/base_movie_repo.dart';

class GetMovieRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, MovieRecommendationParam> {
  BaseMovieRepo baseMovieRepo;

  GetMovieRecommendationUsecase({required this.baseMovieRepo});

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      MovieRecommendationParam param) async {
    return await baseMovieRepo.getMovieRecommendation(param);
  }
}

class MovieRecommendationParam extends Equatable {
  final int movieId;

  const MovieRecommendationParam({required this.movieId});

  @override
  List<Object?> get props => [id];
}
