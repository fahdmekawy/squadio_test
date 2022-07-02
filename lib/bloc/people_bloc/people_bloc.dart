import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/people_bloc/people_events.dart';
import 'package:squadio_test/bloc/people_bloc/people_states.dart';
import 'package:squadio_test/models/people_model/people_model.dart';
import 'package:squadio_test/repositories/people_repository.dart';

import '../../repositories/authentication_repositroy.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc() : super(PeopleUninitialized()) {
    on<FetchPeople>(getPeople);
  }

  int page = 0;
  List<Result> data = [];
  bool hasReachMax = false;

  Future<void> getPeople(FetchPeople event, Emitter<PeopleState> emit) async {
    emit(PeopleLoading());
    try {
      if (hasReachMax) {
        return;
      }
      page++;
      final token = await getToken();
      final subDomain = await getSubdomain();

      PeopleModel peopleModel = await PeopleRepository.getPeople(
          subDomain: subDomain??'', page: page, token: token??'');

      if ((peopleModel.data?.pagination?.current_page ?? 0) >=
          (peopleModel.data?.pagination?.total_pages ?? 0)) {
        hasReachMax = true;
      }
      data.addAll(peopleModel.data?.result ?? []);

      emit(PeopleLoaded(peopleModel: data));
    } catch (e) {
      emit(PeopleFailed(e.toString()));
    }
  }
}
