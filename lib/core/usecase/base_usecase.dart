import 'package:dartz/dartz.dart';
import 'package:movies/core/error/failure.dart';

abstract class BaseUsecase<T> {
  Future<Either<Failure, T>> call();
}
