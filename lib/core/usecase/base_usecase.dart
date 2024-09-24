import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failure.dart';

abstract class BaseUsecase<T, Param> {
  Future<Either<Failure, T>> call(Param param);
}

class NoParam extends Equatable {
  const NoParam();
  @override
  List<Object?> get props => [];
}
