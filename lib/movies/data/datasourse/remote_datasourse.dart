import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_recommendation_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseRemoteDatasourse {
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParam param);
  Future<List<RecommendationModel>> getMovieRecommendation(
      MovieRecommendationParam param);
}

class RemoteDatasourse extends BaseRemoteDatasourse {
  @override
  Future<List<MovieModel>> getPlayingNow() async {
    var res = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (res.statusCode == 200) {
      var results = res.data['results'];
      return List<MovieModel>.from(results.map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var res = await Dio().get(ApiConstance.popularMoviesPath);
    if (res.statusCode == 200) {
      var results = res.data['results'];
      return List<MovieModel>.from(results.map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var res = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (res.statusCode == 200) {
      var results = res.data['results'];
      return List<MovieModel>.from(results.map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(param) async {
    final res = await Dio().get(ApiConstance.movieDetailsPath(param.movieId));
    if (res.statusCode == 200) {
      return MovieDetailsModel.fromJson(res.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
      MovieRecommendationParam param) async {
    var res = await Dio().get(ApiConstance.recommendationPath(param.movieId));

    if (res.statusCode == 200) {
      var result = res.data['results'];
      return List<RecommendationModel>.from(
        result.map((e) => RecommendationModel.fromJson(e)),
      );
    } else {
      throw ServerExceptions(
        errorMessageModel: ErrorMessageModel.fromJson(res.data),
      );
    }
  }
}
