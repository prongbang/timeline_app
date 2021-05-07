import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:timeline/timeline/presentation/timeline_viewmodel.dart';
import 'package:timeline/timeline/presentation/timeline_widget.dart';

class TimelinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timeline')),
      body: Provider(
        create: (_) => GetIt.I.get<TimelineViewModel>(),
        child: TimelineWidget(),
      ),
    );
  }
}
