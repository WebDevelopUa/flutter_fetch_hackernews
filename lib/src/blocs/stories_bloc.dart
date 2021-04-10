/// Top News Screen - NewsList Widget

import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _repository = Repository();

  // Stream Controller
  final _topIds = PublishSubject<List<int>>();

  // getter to Stream (adds data to stream)
  Stream<List<int>> get topIds => _topIds.stream;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  dispose() {
    _topIds.close();
  }
}
