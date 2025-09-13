import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/repository/auth_repository_impl.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  factory LoginUser.defaultRepo() {
    return LoginUser(AuthRepositoryImpl());
  }

  Future<Either<MainFailure, LoginModel>> call({
    required String email,
    required String password,
  }) {
    return repository.login(email: email, password: password);
  }
}
