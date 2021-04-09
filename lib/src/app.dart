import 'package:flutter/material.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fetch Hacker News App',
      home: NewsList(),
    );
  }
}
