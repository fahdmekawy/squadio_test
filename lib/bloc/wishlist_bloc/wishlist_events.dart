import 'package:equatable/equatable.dart';
import 'package:squadio_test/models/people_model/people_model.dart';

abstract class WishlistEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddItemToList extends WishlistEvent {
  final Result? item;

  AddItemToList({required this.item});

  @override
  List<Object> get props => [item ?? ''];
}

class FetchList extends WishlistEvent {
  final List<Result>? items;

  FetchList({this.items});

  @override
  List<Object> get props => [items ?? []];
}

class ClearList extends WishlistEvent {}
