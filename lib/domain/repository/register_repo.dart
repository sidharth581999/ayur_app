import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';

abstract class RegisterRepository {
  Future<Either<MainFailure, Branches>> getBranches();
  Future<Either<MainFailure, Treatments>> getTreatments();
  Future<Either<MainFailure, dynamic>> registerPatient({Map<String, dynamic> data});
}
