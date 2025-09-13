import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/remote/api_client.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<Either<MainFailure, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      print("4-------------------------");
      final result = await ApiClient.login(email, password);
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }
}
