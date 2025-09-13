import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<MainFailure, LoginModel>> login({
    required String email,
    required String password,
  });
}
