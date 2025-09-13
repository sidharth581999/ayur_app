import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class PatientRepository {
  Future<Either<MainFailure, PatientListModel>> getPatients();
  Future<Either<MainFailure, PatientListModel>> searchPatients({String search, String date});
}
