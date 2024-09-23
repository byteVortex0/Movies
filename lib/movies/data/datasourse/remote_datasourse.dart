import 'package:dio/dio.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_model.dart';

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
