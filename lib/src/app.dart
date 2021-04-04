import 'package:flutter/material.dart';
import 'resources/news_api_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fetch Hacker News App',
      home: Scaffold(
        // body: fetchItemTest(),
        appBar: AppBar(
          title: Text('Hacker News'),
        ),
      ),
    );
  }

  // For a console.log of fetched ids
  fetchItemTest() async {
    final newsApi = NewsApiProvider();
    final ids = await newsApi.fetchTopIds();
    final item = await newsApi.fetchItem(26674733);
    print(ids);
    print(item);
  }
}
