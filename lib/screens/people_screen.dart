import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadio_test/bloc/people_bloc/people_bloc.dart';
import 'package:squadio_test/bloc/people_bloc/people_events.dart';
import 'package:squadio_test/bloc/people_bloc/people_states.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_bloc.dart';
import 'package:squadio_test/bloc/wishlist_bloc/wishlist_events.dart';
import 'package:squadio_test/helpers/navigators.dart';
import 'package:squadio_test/repositories/authentication_repositroy.dart';
import 'package:squadio_test/screens/home_screen.dart';
import 'package:squadio_test/widgets/appbar.dart';
import '../widgets/default_btn.dart';
import '../widgets/horizantal_list.dart';
import '../widgets/people_list_widget.dart';

class PeopleScreen extends StatefulWidget {
  static String routeName = '/people';

  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  bool toggleValue = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PeopleBloc>(
            create: (context) => PeopleBloc()..add(FetchPeople())),
        BlocProvider(create: (context) => WishListBloc())
      ],
      child: Scaffold(
        appBar: buildAppBar(
            title: 'People',
            backButton: false,
            logout: () {
              deleteToken();
              deleteSubDomain();
              popAndPush(context, HomeScreen.routeName);
            },
            logOutButton: true),
        body: BlocBuilder<PeopleBloc, PeopleState>(
          buildWhen: (previous, current) => current is PeopleLoaded,
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
                          child: PeopleListWidget(people: people),
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
}
