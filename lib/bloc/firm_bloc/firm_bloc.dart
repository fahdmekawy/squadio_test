import 'package:squadio_test/bloc/firm_bloc/firm_events.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/models/firm_model/firm_model.dart';
import 'package:squadio_test/repositories/firm_repository.dart';

class FirmsBloc extends Bloc<FirmsEvent, FirmsState> {
  FirmsBloc() : super(FirmsUninitialized()) {
    on<FetchFirms>(getUsers);
  }

  Future<void> getUsers(FetchFirms event, Emitter<FirmsState> emit) async {
    emit(FirmsLoading());
    try {
      FirmModel firmModel = await FirmRepository.getFirms();

      List firmNamesSorted = firmModel.data!
        ..sort((a, b) => a.firm.toString().compareTo(b.firm.toString()));

      emit(FirmsLoaded(data: firmNamesSorted));
    } catch (e) {
      emit(FirmsFailed(e.toString()));
    }
  }
}
