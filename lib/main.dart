import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timeline/service_locator.dart';
import 'package:timeline/timeline/presentation/timeline_page.dart';

void main() async {
  await GetStorage.init();
  ServiceLocator.setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TimelinePage(),
    );
  }
}
