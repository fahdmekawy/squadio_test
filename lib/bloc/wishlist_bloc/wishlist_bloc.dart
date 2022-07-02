import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_events.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_states.dart';
import '../../models/people_model/people_model.dart';
import 'package:collection/collection.dart';

class WishListBloc extends Bloc<WishlistEvent, WishListState> {
  WishListBloc() : super(WishListUninitialized()) {
    on<AddItemToList>(addItem);
    // on<ClearList>(clearItem);
    // on<FetchList>(showItems);
  }

  List<Result> list = [];

  bool isSelected(int? selectedId) {
    return list.firstWhereOrNull((element) => element.id == selectedId) != null
        ? true
        : false;
  }

  Future<void> addItem(AddItemToList event, Emitter<WishListState> emit) async {
    if (event.item?.isSelected == true) {
      event.item?.isSelected = false;
      list.removeWhere((element) => element.id == event.item?.id);
    } else {
      event.item?.isSelected = true;
      list.add(event.item!);
    }
    emit(AddedItem());
    emit((ListLoaded(items: list)));
  }

//   Future<void> clearItem(ClearList event, Emitter<WishListState> emit) async {
//     list.clear();
//     emit(ClearingList());
//   }
//
//   Future<void> showItems(FetchList event, Emitter<WishListState> emit) async {
}
