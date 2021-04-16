/// News Detail Screen - NewsDetail Widget
/// CommentsFetcher (StreamController) => Transformer => CommentsOutput (StreamController) =>
/// => Stream Subscription (1 of n) => Comment (StreamBuilder) (1 of n) =>
/// => kids (StreamBuilder) (1 of n) => kids (StreamBuilder) (1 of n) => kids (StreamBuilder) (1 of n)

import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class CommentsBloc {
  // private variables (not accessible outside this file)
  final _repository = Repository();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _commentsFetcher = PublishSubject<int>();

  // Stream getter (to get item with a list of comments)
  Stream<Map<int, Future<ItemModel>>> get itemWithComments =>
      _commentsOutput.stream;

  // Sink getter (adds data to sink, every widget can access getter)
  Function(int) get fetchItemWithComments => _commentsFetcher.sink.add;

  // pipe (forwarding all the events from one stream to another)
  CommentsBloc() {
    _commentsFetcher.stream
        .transform(_commentsTransformer())
        .pipe(_commentsOutput);
  }

  // helps to fix multiple StreamBuilders rebuild when new item comes
  // to a Stream for individual events, using cache map
  // do a recursive fetching
  _commentsTransformer() {
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>>(
      (cache, int id, index) {
        print('-------- comments index: $index ');
        cache[id] = _repository.fetchItem(id);
        cache[id].then((ItemModel item) {
          item.kids.forEach((kidId) => fetchItemWithComments(kidId));
        });

        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}
