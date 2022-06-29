import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/firm_model/firm_model.dart';

abstract class FirmsState extends Equatable {
  const FirmsState();

  @override
  List<Object> get props => [];
}

class FirmsUninitialized extends FirmsState {}

class FirmsLoading extends FirmsState {}

class FirmsLoaded extends FirmsState {
  final FirmModel? firmModel;

  FirmsLoaded({this.firmModel});
}

class FirmsFailed extends FirmsState {
  final String message;

  const FirmsFailed(this.message);

  @override
  List<Object> get props => [message];
}
