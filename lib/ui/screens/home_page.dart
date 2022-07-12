import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/GET/get_news_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: const Center(child: Text('')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = GetNewsData(dio: Dio()).getTopicHeadline('WORLD');
        },
      ),
    );
  }
}
