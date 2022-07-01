import 'package:equatable/equatable.dart';

abstract class PeopleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPeople extends PeopleEvent {
  String subDomain;
  int? page;
  String token;

  FetchPeople(
      {required this.subDomain, this.page, required this.token});
  @override
  List<Object> get props => [subDomain,page??0,token];
}
