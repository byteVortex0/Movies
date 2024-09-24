import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_details.dart';
import '../repository/base_movie_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetails, MovieDetailsParam> {
  BaseMovieRepo baseMovieRepo;
  GetMovieDetailsUseCase({
    required this.baseMovieRepo,
  });

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParam param) async {
    return await baseMovieRepo.getMovieDetails(param);
  }
}

class MovieDetailsParam extends Equatable {
  final int movieId;

  const MovieDetailsParam({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
