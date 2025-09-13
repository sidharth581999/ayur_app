import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/data/repository/patient_repo_impl.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/patient_repo.dart';
import 'package:dartz/dartz.dart';

class GetPatients {
  final PatientRepository repository;

  GetPatients(this.repository);

  factory GetPatients.defaultRepo() {
    return GetPatients(PatientRepositoryImpl());
  }

  Future<Either<MainFailure, PatientListModel>> getPatients() {
    return repository.getPatients();
  }

  Future<Either<MainFailure, PatientListModel>> searchPatient({
    required String search,
    required String date,
  }) {
    return repository.searchPatients();
  }
}
