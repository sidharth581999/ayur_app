import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/data/repository/auth_repository_impl.dart';
import 'package:ayur/data/repository/patient_repo_impl.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/auth_repo.dart';
import 'package:ayur/domain/repository/patient_repo.dart';
import 'package:dartz/dartz.dart';

class GetPatients {
  final PatientRepository repository;

  GetPatients(this.repository);

  factory GetPatients.defaultRepo() {
    return GetPatients(PatientRepositoryImpl());
  }

  Future<Either<MainFailure, PatientListModel>> getPatients({
    required String email,
    required String password,
  }) {
    return repository.GetPatients();
  }

  Future<Either<MainFailure, PatientListModel>> searchPatient({
    required String email,
    required String password,
  }) {
    return repository.GetPatients();
  }
}
