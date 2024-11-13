import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keywa_test_application/Ui/screens/home_scree.dart';
import 'package:keywa_test_application/bloc/home_bloc.dart';
import 'package:keywa_test_application/bloc/home_event.dart';
import 'package:keywa_test_application/d_injection.dart/di.dart';
import 'package:keywa_test_application/theme/theme.dart';

void main(List<String> args) {
  initLocator();
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) {
          var bloc = locator.get<HomeBloc>();
          bloc.add(HomeFetchDateEvent());
          return bloc;
        },
        child: const HomeScreen(),
      ),
    );
  }
}
