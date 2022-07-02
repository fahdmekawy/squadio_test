import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/people_model/people_model.dart';

abstract class WishListState extends Equatable {
  const WishListState();

  @override
  List<Object> get props => [];
}

class WishListUninitialized extends WishListState {}

class AddedItem extends WishListState {}


class ListLoaded extends WishListState {
  final List<Result>? items;

  const ListLoaded({this.items});

  @override
  List<Object> get props => [items ?? []];
}

// class ClearingList extends WishListState {}

class WishListFailed extends WishListState {}
