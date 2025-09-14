import 'dart:async';

import 'package:ayur/data/models/branch_model.dart';
import 'package:ayur/data/models/treatment_model.dart';
import 'package:ayur/domain/usecase/register_patient.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterBuildEvent>(registerBuildEvent);
  }

  FutureOr<void> registerBuildEvent(RegisterBuildEvent event, Emitter<RegisterState> emit) async{
    emit(RegisterBuildState(branches: [], treatments: [], isLoading: true));
    final regUser = RegisterPatients.defaultRepo();
    final branches = await regUser.getBranches();  
    final treatments = await regUser.getTreatments();  

emit(
  RegisterBuildState(
    branches: branches.fold(
      (l) => [],
      (r) => r.branches??[], 
    ),
    treatments: treatments.fold(
      (l) => [], 
      (r) => r.treatments??[],
    ),
    isLoading: false,
  ),
);


  }
}
