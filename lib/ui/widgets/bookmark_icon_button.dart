import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkIconButton extends StatelessWidget {
  final NewsInformation newsInformation;
  const BookmarkIconButton({Key? key, required this.newsInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.bookmark),
      onPressed: () {
        SharedPreferences preferences =
            Provider.of<SharedPreferences>(context, listen: false);
        if (preferences.containsKey(newsInformation.title)) {
          showSnackBar(
            context,
            "You have already saved this news",
            Colors.blue,
          );
        } else {
          preferences.setStringList(newsInformation.title, [
            //List order is hard-coded eg. [publishDate : index = 0 , source : index =  1 , link : index = 2]
            newsInformation.publishDate,
            newsInformation.source,
            newsInformation.link,
          ]);
          showSnackBar(
            context,
            "You successfully saved this news",
            Colors.green,
          );
        }
      },
    );
  }

  void showSnackBar(BuildContext context, String message, Color color) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
