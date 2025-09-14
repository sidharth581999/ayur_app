part of 'register_click_bloc_bloc.dart';

@immutable
sealed class RegisterClickBlocEvent {}

class RegisterClickedEvent extends RegisterClickBlocEvent {
  final Map<String,dynamic> data;

  RegisterClickedEvent({required this.data});
}