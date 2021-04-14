/// RefreshIndicator => StoriesBloc => Repository => DB Provider => dump all the Data in SqlDb

import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
        print('REFRESHED! ... DUMPED EVERYTHING in SqlDb');
      },
    );
  }
}
