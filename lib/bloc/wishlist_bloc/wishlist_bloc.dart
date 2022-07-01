import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_events.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_states.dart';
import '../../models/people_model/people_model.dart';

class WishListBloc extends Bloc<WishlistEvent, WishListState> {
  WishListBloc() : super(WishListUninitialized()) {
    on<AddItemToList>(addItem);
    on<ClearList>(clearItem);
    on<FetchList>(showItems);
  }

  late Result item;
  List<Result> list = [];


  Future<void> addItem(AddItemToList event, Emitter<WishListState> emit) async {
    emit(AddItemLoading());

    if (event.item?.isSelected == true) {
      event.item?.isSelected = false;
      list.remove(item);
    } else {
      event.item?.isSelected = true;
      list.add(event.item!);
    }
    emit(AddItem());
  }

  Future<void> clearItem(ClearList event, Emitter<WishListState> emit) async {
    list.clear();
    emit((ListLoaded(items: list)));
  }

  Future<void> showItems(FetchList event, Emitter<WishListState> emit) async {
    emit((ListLoaded(items: list)));
  }
}
