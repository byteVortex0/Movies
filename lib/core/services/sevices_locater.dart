import 'package:get_it/get_it.dart';
import 'package:movies/movies/data/datasourse/remote_datasourse.dart';
import 'package:movies/movies/data/repository/movie_repo.dart';
import 'package:movies/movies/domain/repository/base_movie_repo.dart';
import 'package:movies/movies/domain/usecases/get_now_playing_usecase.dart';

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
  }
}
