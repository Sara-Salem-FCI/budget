import 'package:equatable/equatable.dart';

/// Base failure class for the application.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Represents a failure during a network request.
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Represents a failure due to no internet connection.
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

/// Represents an unexpected failure.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
