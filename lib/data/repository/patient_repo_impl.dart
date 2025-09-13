
import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/data/remote/api_client.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/patient_repo.dart';
import 'package:dartz/dartz.dart';

class PatientRepositoryImpl implements PatientRepository {

  @override
  Future<Either<MainFailure, PatientListModel>> getPatients() async {
    try {
      final result = await ApiClient.getPatients();
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }

 @override
  Future<Either<MainFailure, PatientListModel>> searchPatients({
  String? search,
  String? date,
}) async {
    try {
      print("4-------------------------");
      final result = await ApiClient.getPatients();
      return right(result);
    } catch (e) {
      return left(MainFailure.genericError(errorMsg: e.toString()));
    }
  }
}
