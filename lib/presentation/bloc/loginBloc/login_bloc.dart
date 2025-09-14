import 'dart:async';
import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/storage/login_data.dart';
import 'package:ayur/domain/usecase/login_user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginClickedEvent>(loginClickedEvent);
  }

  FutureOr<void> loginClickedEvent(LoginClickedEvent event, Emitter<LoginState> emit) async{
    emit(LoginClickedState(isLoading: true, isError: false, isSuccess: false, user: null, errorMsg: ""));
    final loginUser = LoginUser.defaultRepo();
    final response = await loginUser.call(email: event.email, password: event.password);
    emit(
      response.fold((L){
        return LoginClickedState(isLoading: false, isError: true, isSuccess: false, user: null, errorMsg: L.errorMsg);
      }, (R){
        LoginDataStore.saveLogin(R);
        return
         LoginClickedState(isLoading: false, isError: false, isSuccess: true, user: R, errorMsg: "");
      })
    );
  }
}
