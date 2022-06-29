import 'package:equatable/equatable.dart';

abstract class FirmsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFirms extends FirmsEvent {}
