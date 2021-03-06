import 'dart:convert';
import 'package:flutter_fetch_hackernews/src/resources/news_api_provider.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('fetchTopIds() returns a list of IDs', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });

    final ids = await newsApi.fetchTopIds();

    expect(ids, [1, 2, 3, 4]);
  });

  test('fetchItem() returns a item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 1234};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(777);

    expect(item.id, 1234);
  });
}
