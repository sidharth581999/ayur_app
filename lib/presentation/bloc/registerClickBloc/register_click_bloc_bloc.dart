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
    final regUser = RegisterPatients.defaultRepo();
    final branches = await regUser.registerPatient(data: event.data);  
  }
}
