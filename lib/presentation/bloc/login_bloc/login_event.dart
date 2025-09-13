part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginClickedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginClickedEvent({required this.email, required this.password});
}
