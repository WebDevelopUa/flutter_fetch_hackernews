/// App (fetch item) => Repository => NewsDbProvider (SQLite) || NewsApiProvider (HackerNewsApi)
/// mediation access to NewsDbProvider or NewsApiProvider
/// cache should be updated in some period of time (expire records) or pull down screen to refresh data

import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

class Repository {
  /// Instances before code refactoring:
  /// NewsDbProvider dbProvider = NewsDbProvider();
  /// NewsApiProvider apiProvider = NewsApiProvider();
  ///
  /// Future<ItemModel> fetchItem(int id) async {
  ///   var item = await dbProvider.fetchItem(id);
  ///   if (item != null) {
  ///     return item;
  ///   }
  ///   item = await apiProvider.fetchItem(id);
  ///   dbProvider.addItem(item);
  ///   return item;
  /// }
  ///
  /// Future<List<int>> fetchTopIds() {
  ///   return apiProvider.fetchTopIds();
  /// }

  List<Source> sources = <Source>[
    newsDbProvider,
    NewsApiProvider(),
  ];

  List<Cache> caches = <Cache>[
    newsDbProvider,
  ];

  // Iterate over sources when DBprovider get fetchTopIds implemented
  Future<List<int>> fetchTopIds() {
    return sources[1].fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async {
    ItemModel item;
    var source;

    for (source in sources) {
      item = await source.fetchItem(id);
      if (item != null) {
        break;
      }
    }

    for (var cache in caches) {
      if (cache != source) {
        cache.addItem(item);
      }
    }

    return item;
  }

  clearCache() async {
    for (var cache in caches) {
      await cache.clear();
    }
  }
}

abstract class Source {
  Future<List<int>> fetchTopIds();

  Future<ItemModel> fetchItem(int id);
}

abstract class Cache {
  Future<int> addItem(ItemModel item);

  Future<int> clear();
}
