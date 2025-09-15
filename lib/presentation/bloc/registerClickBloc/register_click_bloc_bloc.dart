import 'dart:async';

import 'package:ayur/domain/usecase/register_patient.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_click_bloc_event.dart';
part 'register_click_bloc_state.dart';

class RegisterClickBlocBloc extends Bloc<RegisterClickBlocEvent, RegisterClickBlocState> {
  RegisterClickBlocBloc() : super(RegisterClickBlocInitial()) {
    on<RegisterClickedEvent>(registerClickedEvent);
  }

  FutureOr<void> registerClickedEvent(RegisterClickedEvent event, Emitter<RegisterClickBlocState> emit) async{
    emit(RegisterClickedState(isLoading: true, isError: false, isSuccess: false, errorMsg: null));
    final regUser = RegisterPatients.defaultRepo();
    final responce = await regUser.registerPatient(data: event.data); 
    emit(
      responce.fold((l)=>RegisterClickedState(isLoading: false, isError: true, isSuccess: false, errorMsg: l.errorMsg),
      (r) => RegisterClickedState(isLoading: false, isError: false, isSuccess: true, errorMsg: "Succesfully registered"),)
    );
  }
}
