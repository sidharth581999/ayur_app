part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterBuildState extends RegisterState {
  final List<Branch> branches;
  final List<Treatment> treatments;
  final bool isLoading;

  RegisterBuildState({required this.branches, required this.treatments, required this.isLoading});
}
