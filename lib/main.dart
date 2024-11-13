import 'package:flutter/material.dart';
import 'package:keywa_test_application/Ui/screens/home_scree.dart';

void main(List<String> args) {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
