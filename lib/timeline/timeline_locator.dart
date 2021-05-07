import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timeline/timeline/data/timeline_datasource.dart';
import 'package:timeline/timeline/domain/add_timeline_usecase.dart';
import 'package:timeline/timeline/domain/get_timeline_usecase.dart';
import 'package:timeline/timeline/presentation/timeline_viewmodel.dart';

class TimelineLocator {
  static void setup() {
    GetIt.I.registerFactory(() => GetStorage());
    GetIt.I.registerFactory(() => TimelineDataSource(GetIt.I.get()));
    GetIt.I.registerFactory(() => AddTimelineUseCase(GetIt.I.get()));
    GetIt.I.registerFactory(() => GetTimelineUseCase(GetIt.I.get()));
    GetIt.I
        .registerFactory(() => TimelineViewModel(GetIt.I.get(), GetIt.I.get()));
  }
}
