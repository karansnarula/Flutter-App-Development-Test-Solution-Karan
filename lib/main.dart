import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/GET/get_news_data.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GetNewsData>(create: (context) => GetNewsData(dio: Dio())),
        Provider<SharedPreferences>(create: (context) => preferences)
      ],
      child: const MaterialApp(
        title: 'News App',
        home: HomePage(),
      ),
    );
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }
}
