import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/news_information.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final NewsInformation newsInformation;
  const CustomIconButton(
      {Key? key, required this.icon, required this.newsInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () async {
        SharedPreferences preferences =
            Provider.of<SharedPreferences>(context, listen: false);
        if (icon == Icons.bookmark) {
          if (preferences.containsKey(newsInformation.title)) {
            showSnackBar(
              context,
              "You have already saved this news",
              Colors.blue,
            );
          } else {
            preferences.setStringList(newsInformation.title, [
              newsInformation.publishDate,
              newsInformation.link,
            ]);
            showSnackBar(
              context,
              "You successfully saved this news",
              Colors.green,
            );
          }
        } else {
          preferences.remove(newsInformation.title);
          showSnackBar(
            context,
            "You have successfully removed this news",
            Colors.red,
          );
        }
      },
    );
  }

  void showSnackBar(BuildContext context, String message, Color color) {
    SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
