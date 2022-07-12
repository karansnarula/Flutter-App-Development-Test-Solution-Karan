import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/GET/get_news_data.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: ((context) => GetNewsData(dio: Dio())),
      child: const MaterialApp(
        title: 'News App',
        home: HomePage(),
      ),
    );
  }
}
