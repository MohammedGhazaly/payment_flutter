import 'package:dartz/dartz.dart';

abstract class Failure {
  final String errorMessage;

  Failure({required this.errorMessage});
}

class StripeFailure extends Failure {
  StripeFailure({required super.errorMessage});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.errorMessage});
}
