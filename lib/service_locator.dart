import 'package:get_it/get_it.dart';
import 'package:timeline/timeline/timeline_locator.dart';

GetIt locator = GetIt.instance;

class ServiceLocator {
  static void setupLocator() {
    TimelineLocator.setup();
  }
}
