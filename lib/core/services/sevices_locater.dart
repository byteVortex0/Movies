import 'package:get_it/get_it.dart';
import '../../movies/domain/usecases/get_movie_recommendation_usecase.dart';
import '../../movies/domain/usecases/get_movie_details_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/data/datasourse/remote_datasourse.dart';
import '../../movies/data/repository/movie_repo.dart';
import '../../movies/domain/repository/base_movie_repo.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';
import '../../movies/presentation/controller/bloc/movie_details_bloc.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocater {
  init() {
    sl.registerLazySingleton<BaseRemoteDatasourse>(
      () => RemoteDatasourse(),
    );
    sl.registerLazySingleton<BaseMovieRepo>(
      () => MovieRepo(baseRemoteDatasourse: sl()),
    );
    sl.registerLazySingleton<GetNowPlayingUsecase>(
      () => GetNowPlayingUsecase(baseMovieRepo: sl()),
    );
    sl.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(baseMovieRepo: sl()),
    );
    sl.registerLazySingleton<GetTopRatedMoviesUsecase>(
      () => GetTopRatedMoviesUsecase(baseMovieRepo: sl()),
    );
    sl.registerLazySingleton<GetMovieDetailsUseCase>(
      () => GetMovieDetailsUseCase(baseMovieRepo: sl()),
    );
    sl.registerLazySingleton<GetMovieRecommendationUsecase>(
      () => GetMovieRecommendationUsecase(baseMovieRepo: sl()),
    );
    sl.registerFactory<MoviesBloc>(
      () => MoviesBloc(sl(), sl(), sl()),
    );
    sl.registerFactory<MovieDetailsBloc>(
      () => MovieDetailsBloc(sl(), sl()),
    );
  }
}
