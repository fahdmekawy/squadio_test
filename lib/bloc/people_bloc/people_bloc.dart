import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/people_bloc/people_events.dart';
import 'package:squadio_test/bloc/people_bloc/people_states.dart';
import 'package:squadio_test/models/people_model/people_model.dart';
import 'package:squadio_test/repositories/people_repository.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  PeopleBloc() : super(PeopleUninitialized()) {
    on<FetchPeople>(getPeople);
  }

  Future<void> getPeople(FetchPeople event, Emitter<PeopleState> emit) async {
    emit(PeopleLoading());
    try {
      PeopleModel peopleModel = await PeopleRepository.getPeople();

      emit(PeopleLoaded(peopleModel: peopleModel));
    } catch (e) {
      emit(PeopleFailed(e.toString()));
    }
  }
}
