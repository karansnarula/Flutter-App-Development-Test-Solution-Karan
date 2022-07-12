import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';

class NewsCard extends StatelessWidget {
  final NewsInformation newsInformation;
  const NewsCard({Key? key, required this.newsInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(newsInformation.title),
          Row(
            children: [
              Text(newsInformation.publishDate),
              const Text("Read more..."),
            ],
          )
        ],
      ),
    );
  }
}
