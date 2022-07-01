import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadio_test/bloc/people_bloc/people_bloc.dart';
import 'package:squadio_test/bloc/people_bloc/people_events.dart';
import 'package:squadio_test/bloc/people_bloc/people_states.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_bloc.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_events.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_states.dart';
import 'package:squadio_test/helpers/navigators.dart';
import 'package:squadio_test/repositories/authentication_repositroy.dart';
import 'package:squadio_test/screens/home_screen.dart';
import 'package:squadio_test/widgets/appbar.dart';
import '../widgets/default_btn.dart';
import '../widgets/horizantal_list.dart';

class PeopleScreen extends StatefulWidget {
  static String routeName = '/people';

  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final ScrollController _scrollController = ScrollController();

  String? token;
  String? subDomain;

  bool toggleValue = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    getToken().then((value) {
      token = value;
    });

    getSubdomain().then((value) {
      subDomain = value;
    });
    print(token);
    print(subDomain);
  }

  @override
  Widget build(BuildContext context) {
    List? args = ModalRoute.of(context)?.settings.arguments as List?;

    return Scaffold(
      appBar: buildAppBar(
          title: 'People',
          backButton: false,
          logout: () {
            deleteToken();
            deleteSubDomain();
            popAndPush(context, HomeScreen.routeName);
          },
          logOutButton: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PeopleBloc>(
              create: (context) => PeopleBloc()
                ..add(FetchPeople(token: args?[0], subDomain: args?[1]))),
          BlocProvider(create: (context) => WishListBloc())
        ],
        child: BlocBuilder<PeopleBloc, PeopleState>(
          builder: (context, state) {
            if (state is PeopleLoaded) {
              final people = state.peopleModel;
              return SafeArea(
                  child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Switch.adaptive(
                        value: toggleValue,
                        activeColor: Colors.green[700],
                        activeTrackColor: Colors.green[700]?.withOpacity(0.4),
                        onChanged: (value) {
                          setState(() {
                            toggleValue = value;
                          });
                        }),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(height: 10.h),
                        HorizentalList(toggleValue: toggleValue),
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: people.length,
                            itemBuilder: (context, index) => ListTile(
                                onTap: () async {
                                  context.read<WishListBloc>().add(
                                        AddItemToList(
                                          item: people[index],
                                        ),
                                      );

                                  var token = await getToken();
                                },
                                leading: CircleAvatar(
                                  backgroundColor: Colors.green[700],
                                  child:
                                      const Icon(Icons.person_outline_outlined),
                                ),
                                title: Text(
                                  people[index].name ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Text(
                                  people[index].email ?? '',
                                  style: TextStyle(fontSize: 12.sp),
                                ),
                                trailing:
                                    BlocBuilder<WishListBloc, WishListState>(
                                  builder: (context, state) {
                                    return state is ListLoaded &&
                                            (state.items
                                                    ?.contains(people[index]) ??
                                                false)
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
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 50.h,
                    color: Colors.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DefaultButton(
                            title: 'Clear',
                            width: 100,
                            onPressed: () {
                              context.read<WishListBloc>().add(ClearList());
                            },
                          ),
                          DefaultButton(
                            title: 'Add',
                            width: 100,
                            onPressed: () {
                              context.read<WishListBloc>().add(FetchList());
                            },
                          )
                        ]),
                  )
                ],
              ));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
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
      context
          .read<PeopleBloc>()
          .add(FetchPeople(token: token ?? '', subDomain: subDomain ?? ''));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
