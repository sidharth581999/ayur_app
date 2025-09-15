part of 'pdf_bloc.dart';

@immutable
sealed class PdfState {}

final class LoginInitial extends PdfState {}

final class PdfBuildState extends PdfState {
  final List<AddedTreatmentModel> treatments;
  final String name;
  final String address;
  final String nmber;
  final String adwance;
  final String amount;
  final String discount;
  final String balance;
  final String dateTime;

  PdfBuildState({required this.treatments, required this.name, required this.address, required this.nmber, required this.adwance, required this.amount, required this.discount, required this.balance, required this.dateTime});

 
}