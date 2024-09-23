import 'package:dio/dio.dart';
import 'package:movies/core/error/exceptions.dart';
import 'package:movies/core/network/error_message_model.dart';
import 'package:movies/movies/data/models/movie_model.dart';

abstract class BaseRemoteDatasourse {
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteDatasourse extends BaseRemoteDatasourse {
  @override
  Future<List<MovieModel>> getPlayingNow() async {
    var res = await Dio().get('');

    if (res.statusCode == 200) {
      return List<MovieModel>.from(
          (res.data['result'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var res = await Dio().get('');
    if (res.statusCode == 200) {
      return List<MovieModel>.from(
          (res.data['result'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var res = await Dio().get('');
    if (res.statusCode == 200) {
      return List<MovieModel>.from(
          (res.data['result'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(res.data));
    }
  }
}
