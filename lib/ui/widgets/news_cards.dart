import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/date_formatter.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/my_webview.dart';

class NewsCard extends StatelessWidget {
  final NewsInformation newsInformation;
  const NewsCard({Key? key, required this.newsInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.7, //300,
      height: size.height * 0.65, //350,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(newsInformation.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormatter.formatDate(newsInformation.publishDate)),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                              title: newsInformation.source,
                              selectedUrl: newsInformation.link,
                            )));
                  },
                  child: const Text('Read more'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
