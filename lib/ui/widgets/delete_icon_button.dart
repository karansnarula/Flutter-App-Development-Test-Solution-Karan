import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteIconButton extends StatefulWidget {
  final String topic;
  final VoidCallback refreshPage;
  const DeleteIconButton(
      {Key? key, required this.topic, required this.refreshPage})
      : super(key: key);

  @override
  State<DeleteIconButton> createState() => _DeleteIconButtonState();
}

class _DeleteIconButtonState extends State<DeleteIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        SharedPreferences preferences =
            Provider.of<SharedPreferences>(context, listen: false);
        preferences.remove(widget.topic);
        showSnackBar(
            context, "You have successfully removed this news", Colors.red);
        widget.refreshPage();
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
