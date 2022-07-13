import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/api/GET/get_news_data.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';
import 'package:flutter_app_development_test_solution_karan/ui/widgets/news_cards.dart';
import 'package:provider/provider.dart';

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
      body: FutureBuilder(
        future: _getArticles(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            var _newsArticleList = snapshot.data as List<NewsInformation>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _newsArticleList
                        .map((article) => NewsCard(newsInformation: article))
                        .toList(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<List> _getArticles() async {
    var data = Provider.of<GetNewsData>(context, listen: false);
    var newsArticles = await data.getTopicHeadline('WORLD');
    return newsArticles;
  }
}
