import 'package:flutter/material.dart';
import 'package:timeline/timeline/domain/add_timeline_usecase.dart';
import 'package:timeline/timeline/domain/get_timeline_usecase.dart';

class TimelineViewModel extends ChangeNotifier {
  final GetTimelineUseCase getTimelineUseCase;
  final AddTimelineUseCase addTimelineUseCase;

  TimelineViewModel(this.getTimelineUseCase, this.addTimelineUseCase);
}
