import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/data/repository/register_repo_impl.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:ayur/domain/repository/register_repo.dart';
import 'package:dartz/dartz.dart';

class RegisterPatients {
  final RegisterRepository repository;

  RegisterPatients(this.repository);

  factory RegisterPatients.defaultRepo() {
    return RegisterPatients(RegisterRepositoryImpl());
  }

  Future<Either<MainFailure, Branches>> getBranches() {
    return repository.getBranches();
  }

  Future<Either<MainFailure, Treatments>> getTreatments() {
    return repository.getTreatments();
  }
}
