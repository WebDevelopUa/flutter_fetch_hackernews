/// Top News Screen - NewsList Widget
/// fetch id => stream => transformer => cache map => add id
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';
import '../models/item_model.dart';

class StoriesBloc {
  final _repository = Repository();

  // TopIds Stream Controller (rx_subject lib)
  final _topIds = PublishSubject<List<int>>();

  // Items Stream Controller (rx_subject lib)
  final _items = BehaviorSubject<int>();

  Stream<Map<int, Future<ItemModel>>> items;

  // getter to Stream (adds data to stream)
  Stream<List<int>> get topIds => _topIds.stream;

  // getter to Sinks (adds data to sink, every widget can access getter)
  Function(int) get fetchItem => _items.sink.add;

  StoriesBloc() {
    items = _items.stream.transform(_itemsTransformer());
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  // helps to fix multiple StreamBuilders rebuild when new item comes to a Stream for individual events, using cache map
  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, index) {
        print(index);
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _items.close();
  }
}
