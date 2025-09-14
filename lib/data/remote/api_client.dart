import 'package:ayur/application/core/serveice/dio_client.dart';
import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/domain/core/exception/custom_exception.dart';
import 'package:dio/dio.dart';

class ApiClient {
  
  //login api
  static final DioClient _dioClient = DioClient(Dio());

  static Future<LoginModel> login(String email, String password) async {
    try {
      final response = await _dioClient.post(
        '/Login',
        data: {
          'username': email,
          'password': password,
        },
      );
      return LoginModel.fromJson(response.data);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(errMsg: e.toString());
    }
  }

//get patient list
static Future<PatientListModel> getPatients() async {
    try {
      final response = await _dioClient.get(
        '/PatientList',
      );
      return PatientListModel.fromJson(response.data);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(errMsg: e.toString());
    }
  }

  //get branches
static Future<Branches> getBranches() async {
    try {
      final response = await _dioClient.get(
        '/BranchList',
      );
      return Branches.fromJson(response.data);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(errMsg: e.toString());
    }
  }


  //get treatments
static Future<Treatments> getTreatments() async {
    try {
      final response = await _dioClient.get(
        '/TreatmentList',
      );
      return Treatments.fromJson(response.data);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(errMsg: e.toString());
    }
  }


  //registerPtients
static Future<PatientListModel> registerPatient(Map<String,dynamic> data) async {
    try {
      final response = await _dioClient.post(
        '/PatientUpdate',
      );
      return PatientListModel.fromJson(response.data);
    } catch (e) {
      if (e is CustomException) rethrow;
      throw CustomException(errMsg: e.toString());
    }
  }
}
