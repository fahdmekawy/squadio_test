import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadio_test/bloc/people_bloc/people_bloc.dart';
import 'package:squadio_test/bloc/people_bloc/people_events.dart';
import 'package:squadio_test/bloc/people_bloc/people_states.dart';
import 'package:squadio_test/widgets/appbar.dart';

import '../models/demo_model.dart';

class PeopleScreen extends StatefulWidget {
  static String routeName = '/people';

  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  // List<DemoModel> user = [
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  //   DemoModel('Fahd', false),
  // ];
  //
  // List<DemoModel>? selectedList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('People', false),
      body: BlocProvider<PeopleBloc>(
        create: (context) => PeopleBloc()..add(FetchPeople()),
        child: BlocBuilder<PeopleBloc, PeopleState>(
          builder: (context, state) {
            return SafeArea(
              child: state is PeopleLoaded
                  ? Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListView.builder(
                            itemCount: state.peopleModel?.data?.result?.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green[700],
                                child:
                                    const Icon(Icons.person_outline_outlined),
                              ),
                              title: Text(
                                state.peopleModel?.data?.result?[index].name ??
                                    '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                state.peopleModel?.data?.result?[index].email ??
                                    '',
                                style:  TextStyle(fontSize: 12.sp),
                              ),
                              trailing: true
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green[700],
                                    )
                                  : const Icon(
                                      Icons.check_circle,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Center(child: const CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
