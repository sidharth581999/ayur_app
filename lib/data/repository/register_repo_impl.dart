import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/data/remote/api_client.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/register_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {

  @override
  Future<Either<MainFailure, Branches>> getBranches() async {
    try {
      final result = await ApiClient.getBranches();
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }

 @override
  Future<Either<MainFailure, Treatments>> getTreatments({
  String? search,
  String? date,
}) async {
    try {
      print("4-------------------------");
      final result = await ApiClient.getTreatments();
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, dynamic>> registerPatient({Map<String, dynamic>? data}) async {
    try {
      final result = await ApiClient.registerPatient(data!);
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }
}
