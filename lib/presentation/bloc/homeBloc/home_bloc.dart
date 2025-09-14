import 'dart:async';

import 'package:ayur/data/models/patient_model.dart';
import 'package:ayur/domain/usecase/get_patient.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeBuildEvent>(homeBuildEvent);
  }

  FutureOr<void> homeBuildEvent(HomeBuildEvent event, Emitter<HomeState> emit) async{
    emit(HomeBuildState(isLoading: true, isError: false, isSuccess: false, patients: null));
    final getPatients = GetPatients.defaultRepo();
    final response = await getPatients.getPatients();
    print("--------------------------------ttttttttttttt");
print(response);
    emit(
      response.fold(
        (l) => HomeBuildState(isLoading: false, isError: true, isSuccess: false, patients: null, errorMsg: l.errorMsg), 
        (R)=> HomeBuildState(isLoading: false, isError: false, isSuccess: true, patients: R, errorMsg: null), )
    );
  }
}
