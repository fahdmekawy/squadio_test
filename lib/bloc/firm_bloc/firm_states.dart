import 'package:equatable/equatable.dart';

abstract class FirmsState extends Equatable {
  const FirmsState();

  @override
  List<Object> get props => [];
}

class FirmsUninitialized extends FirmsState {}

class FirmsLoading extends FirmsState {}

class FirmsLoaded extends FirmsState {
  final List? data;

   const FirmsLoaded({this.data});

   @override
  List<Object> get props => [data??[]];
}

class FirmsFailed extends FirmsState {
  final String message;

  const FirmsFailed(this.message);

  @override
  List<Object> get props => [message];
}
