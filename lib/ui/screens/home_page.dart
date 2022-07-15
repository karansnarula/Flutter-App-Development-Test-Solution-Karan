import 'package:flutter/material.dart';
import 'package:flutter_app_development_test_solution_karan/ui/screens/news_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences preferences;
  Map<int, String> topicsList = {
    1: 'WORLD',
    2: 'NATION',
    3: 'BUSINESS',
    4: 'TECHNOLOGY',
    5: 'ENTERTAINMENT',
    6: 'SCIENCE',
    7: 'SPORTS',
    8: 'HEALTH',
  };

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => preferences,
      child: DefaultTabController(
        length: 8,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: Text(
                    'The best news app',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                ListTile(
                  title: const Text('News'),
                  onTap: () {
                    const HomePage();
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Saved'),
                  onTap: () {
                    //
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('News App'),
            centerTitle: true,
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: topicsList[1]),
                Tab(text: topicsList[2]),
                Tab(text: topicsList[3]),
                Tab(text: topicsList[4]),
                Tab(text: topicsList[5]),
                Tab(text: topicsList[6]),
                Tab(text: topicsList[7]),
                Tab(text: topicsList[8]),
              ],
            ),
          ),
          body: TabBarView(children: [
            NewsPage(topic: topicsList[1]!),
            NewsPage(topic: topicsList[2]!),
            NewsPage(topic: topicsList[3]!),
            NewsPage(topic: topicsList[4]!),
            NewsPage(topic: topicsList[5]!),
            NewsPage(topic: topicsList[6]!),
            NewsPage(topic: topicsList[7]!),
            NewsPage(topic: topicsList[8]!),
          ]),
        ),
      ),
    );
  }

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }
}
