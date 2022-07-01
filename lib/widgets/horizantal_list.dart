import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/wishlist_bloc/wishlist_bloc.dart';
import '../bloc/wishlist_bloc/wishlist_states.dart';
import 'item_card_widget.dart';

class HorizentalList extends StatelessWidget {
  final bool toggleValue;

  const HorizentalList({Key? key, this.toggleValue = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, state) {
        if (state is ListLoaded && (state.items?.isNotEmpty ?? false)) {
          return toggleValue
              ? SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    itemCount: state.items?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        ItemCardWidget(name: state.items?[index].name ?? ''),
                  ),
                )
              : Wrap(
            runSpacing: 5,
            spacing: 2,
                  direction: Axis.horizontal,
                  children: state.items
                          ?.map((e) => ItemCardWidget(name: e.name ?? ''))
                          .toList() ??
                      [],
                );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
