import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/date_formatter.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/my_webview.dart';
import 'package:flutter_app_development_test_solution_karan/ui/widgets/bookmark_icon_button.dart';

class NewsCard extends StatelessWidget {
  final NewsInformation newsInformation;
  const NewsCard({Key? key, required this.newsInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.7,
      height: size.height * 0.5,
      child: InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Align(
                  child: BookmarkIconButton(newsInformation: newsInformation),
                  alignment: Alignment.topRight,
                ),
                Text(
                  newsInformation.title,
                  style: const TextStyle(
                    fontFamily: 'Times',
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormatter.formatDate(newsInformation.publishDate),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => MyWebView(
                    title: newsInformation.source,
                    selectedUrl: newsInformation.link,
                  )));
        },
      ),
    );
  }
}
