import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_bloc.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_events.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_states.dart';
import 'package:squadio_test/screens/login_screen.dart';
import 'package:squadio_test/widgets/firm_widget.dart';
import '../helpers/navigators.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    FirmsBloc firmsBloc = BlocProvider.of(context);

    Future<void> onRefresh() async {
      firmsBloc.add(FetchFirms());
    }

    return Scaffold(
      body: BlocBuilder<FirmsBloc, FirmsState>(
        builder: (context, state) {
          if (state is FirmsLoaded) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: state.data?.length,
                      itemBuilder: (context, index) => FirmWidget(
                            onTap: () => pushNameWithArguments(
                              context,
                              LoginScreen.routeName,
                              state.data?[index]?.subdomain,
                            ),
                            firmName: state.data?[index]?.firm,
                          )),
                ),
              ),
            );
          } else if (state is FirmsFailed) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
