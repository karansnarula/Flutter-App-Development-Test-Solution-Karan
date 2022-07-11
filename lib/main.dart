import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'News App',
      home: HomePage(),
    );
  }
}
