import 'dart:async';
import 'package:ayur/data/models/login_model.dart';
import 'package:ayur/data/storage/login_data.dart';
import 'package:ayur/domain/usecase/login_user.dart';
import 'package:ayur/presentation/screens/register/register.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pdf_event.dart';
part 'pdf_state.dart';

class PdfBloc extends Bloc<PdfEvent, PdfState> {
  PdfBloc() : super(LoginInitial()) {
    on<PdfBuidEvent>(pdfBuidEvent);
  }


  FutureOr<void> pdfBuidEvent(PdfBuidEvent event, Emitter<PdfState> emit) async{
    emit(PdfBuildState(treatments: event.treatments, name: event.name, address: event.address, nmber: event.nmber, adwance: event.adwance, amount: event.amount, discount: event.discount, balance: event.balance, dateTime: event.dateTime));
  }
}
