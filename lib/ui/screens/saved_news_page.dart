import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/data/model/date_formatter.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/my_webview.dart';
import 'package:flutter_app_development_test_solution_karan/ui/widgets/delete_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedNewsPage extends StatefulWidget {
  const SavedNewsPage({Key? key}) : super(key: key);

  @override
  State<SavedNewsPage> createState() => _SavedNewsPageState();
}

class _SavedNewsPageState extends State<SavedNewsPage> {
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
      body: (keys.isEmpty)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.save),
                  SizedBox(height: 10),
                  Text(
                    'There is no saved news',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: keys.length,
              itemBuilder: ((context, index) {
                return InkWell(
                    child: Card(
                      child: ListTile(
                        title: Text(keys.elementAt(index)),
                        subtitle: Text(DateFormatter.formatDate(
                            preferences.getStringList(
                                keys.elementAt(index))![0])), //get publish date
                        trailing: DeleteIconButton(
                          topic: keys.elementAt(index),
                          refreshPage: refreshPage,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MyWebView(
                                title: preferences.getStringList(keys
                                    .elementAt(index))![1], // get news source
                                selectedUrl: preferences.getStringList(keys
                                    .elementAt(index))![2], // get news URL link
                              )));
                    });
              }),
            ),
    );
  }

  void refreshPage() {
    setState(() {});
  }
}
