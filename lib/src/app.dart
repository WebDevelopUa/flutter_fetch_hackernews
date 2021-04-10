import 'package:flutter/material.dart';
import 'package:flutter_fetch_hackernews/src/blocs/stories_provider.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoriesProvider(
      child: MaterialApp(
        title: 'Flutter Fetch Hacker News App',
        home: NewsList(),
      ),
    );
  }
}
