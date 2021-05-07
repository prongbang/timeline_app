import 'package:timeline/core/usecase.dart';
import 'package:timeline/timeline/data/timeline_datasource.dart';

class GetTimelineUseCase implements UseCase<Null, Map<String, dynamic>> {
  final TimelineDataSource timelineDataSource;

  GetTimelineUseCase(this.timelineDataSource);

  @override
  Future<Map<String, dynamic>> execute(Null request) {
    return timelineDataSource.getTimeline();
  }
}
