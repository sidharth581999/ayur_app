part of 'register_click_bloc_bloc.dart';

@immutable
sealed class RegisterClickBlocState {}

final class RegisterClickBlocInitial extends RegisterClickBlocState {}

class RegisterClickedState extends RegisterClickBlocState {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final String? errorMsg;

  RegisterClickedState({required this.isLoading, required this.isError, required this.isSuccess, required this.errorMsg});
}
