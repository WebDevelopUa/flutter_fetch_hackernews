/// Top News Screen - NewsList Widget
/// fetch id => stream => transformer => cache map => add id
/// itemsFetcher (StreamController) => Transformer => itemsOutput(StreamController) =>
/// => Stream Subscription (1 of n) => NewsListTile (StreamBuilder) (1 of n)

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();

  // TopIds Stream Controller (rx_subject lib)
  final _topIds = PublishSubject<List<int>>();

  // Items Stream Controller (rx_subject lib)
  final _itemsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemsFetcher = PublishSubject<int>();

  // getter to Stream (adds data to stream)
  Stream<List<int>> get topIds => _topIds.stream;

  Stream<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream;

  // getter to Sinks (adds data to sink, every widget can access getter)
  Function(int) get fetchItem => _itemsFetcher.sink.add;

  StoriesBloc() {
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  // helps to fix multiple StreamBuilders rebuild when new item comes to a Stream for individual events, using cache map
  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, index) {
        // print(index);
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();
  }
}
