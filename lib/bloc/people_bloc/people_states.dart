import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/people_model/people_model.dart';

abstract class PeopleState extends Equatable {
  const PeopleState();

  @override
  List<Object> get props => [];
}

class PeopleUninitialized extends PeopleState {}

class PeopleLoading extends PeopleState {}

class PeopleLoaded extends PeopleState {
  final PeopleModel? peopleModel;

  PeopleLoaded({this.peopleModel});
}

class PeopleFailed extends PeopleState {
  final String message;

  const PeopleFailed(this.message);

  @override
  List<Object> get props => [message];
}
