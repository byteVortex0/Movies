import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class ServerFailuer extends Failure {
  const ServerFailuer({required super.message});
}

class LocalFailuer extends Failure {
  const LocalFailuer({required super.message});
}
