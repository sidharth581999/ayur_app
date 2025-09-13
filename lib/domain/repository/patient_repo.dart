import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class PatientRepository {
  Future<Either<MainFailure, PatientListModel>> GetPatients();
  Future<Either<MainFailure, PatientListModel>> SearchPatients({String search, String date});
}
