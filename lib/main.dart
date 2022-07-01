import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadio_test/bloc/firm_bloc/firm_events.dart';
import 'package:squadio_test/repositories/authentication_repositroy.dart';
import 'package:squadio_test/routes.dart';
import 'package:squadio_test/screens/home_screen.dart';
import 'package:squadio_test/screens/people_screen.dart';

import 'bloc/firm_bloc/firm_bloc.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final String? token = await getToken();

  runApp(MyApp(token: token));
}

class MyApp extends StatefulWidget {
  final String? token;

  const MyApp({Key? key, this.token}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      builder: (BuildContext context, Widget? child) => BlocProvider(
        create: (_) => FirmsBloc()..add(FetchFirms()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeScreen.routeName,
          routes: routes,
        ),
      ),
    );
  }
}
