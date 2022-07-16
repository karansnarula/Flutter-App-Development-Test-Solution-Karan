import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedNewsPage extends StatelessWidget {
  const SavedNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences preferences =
        Provider.of<SharedPreferences>(context, listen: false);
    Set<String> keys = preferences.getKeys();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved News'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: ((context, index) {
          return Card(
            child: ListTile(
              title: Text(keys.elementAt(index)),
            ),
          );
        }),
      ),
    );
  }
}
