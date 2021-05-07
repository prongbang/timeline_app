import 'package:timeline/core/usecase.dart';
import 'package:timeline/timeline/data/timeline_datasource.dart';
import 'package:timeline/timeline/domain/place.dart';

class AddTimelineUseCase implements UseCase<Place, void> {
  final TimelineDataSource timelineDataSource;

  AddTimelineUseCase(this.timelineDataSource);

  @override
  Future<void> execute(Place request) {
    return timelineDataSource.addTimeline(request);
  }
}
