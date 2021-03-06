import 'package:flutter/material.dart';
import '../widgets/refresh.dart';
import '../blocs/stories_provider.dart';
import '../widgets/news_list_tile.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    // TODO: delete it (used for testing purposes)
    // bloc.fetchTopIds();

    return Scaffold(
      appBar: AppBar(
        title: Text('TOP NEWS | Hacker News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Refresh(
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, int index) {
                bloc.fetchItem(snapshot.data[index]);

                return NewsListTile(
                  itemId: snapshot.data[index],
                );
              },
            )
        );
      },
    );
  }
}
