import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_bloc.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_states.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirmsBloc, FirmsState>(
        builder: (context, state) {
          if (state is FirmsLoaded) {
            return Column(children: []);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
