import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';
import 'repository.dart';

final _root = 'hacker-news.firebaseio.com';

class NewsApiProvider implements Source {
  Client client = Client();

  Future<List<int>> fetchTopIds() async {
    print('*****************  news_api_provider - fetchTopIds() ****************** #1');
    final response = await client.get(
      Uri.https(_root, 'v0/topstories.json'),
    );
    final ids = json.decode(response.body);

    return ids.cast<int>();
  }

  Future<ItemModel> fetchItem(int id) async {
    print('*****************  news_api_provider - fetchItem(int id) ****************** #2');
    final response = await client.get(
      Uri.https(_root, 'v0/item/$id.json'),
    );
    final parsedJson = json.decode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}
