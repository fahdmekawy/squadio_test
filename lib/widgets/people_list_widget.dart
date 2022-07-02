import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/people_bloc/people_bloc.dart';
import '../bloc/people_bloc/people_events.dart';
import '../bloc/wishlist_bloc/wishlist_bloc.dart';
import '../bloc/wishlist_bloc/wishlist_events.dart';
import '../bloc/wishlist_bloc/wishlist_states.dart';
import '../models/people_model/people_model.dart';

class PeopleListWidget extends StatefulWidget {
  const PeopleListWidget({
    Key? key,
    required this.people,
  }) : super(key: key);

  final List<Result> people;

  @override
  State<PeopleListWidget> createState() => _PeopleListWidgetState();
}

class _PeopleListWidgetState extends State<PeopleListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<PeopleBloc>().add(FetchPeople());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.people.length,
      itemBuilder: (context, index) => ListTile(
          onTap: () async {
            context.read<WishListBloc>().add(
                  AddItemToList(
                    item: widget.people[index],
                  ),
                );
          },
          leading: CircleAvatar(
            backgroundColor: Colors.green[700],
            child: const Icon(Icons.person_outline_outlined),
          ),
          title: Text(
            widget.people[index].name ?? '',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            widget.people[index].email ?? '',
            style: TextStyle(fontSize: 12.sp),
          ),
          trailing: BlocBuilder<WishListBloc, WishListState>(
            builder: (context, state) {
              return state is ListLoaded &&
                      (state.items?.contains(widget.people[index]) ?? false)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.green[700],
                    )
                  : const Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    );
            },
          )),
    );
  }
}
