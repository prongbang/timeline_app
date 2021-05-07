import 'package:get_storage/get_storage.dart';
import 'package:timeline/timeline/domain/place.dart';

class TimelineDataSource {
  static const String _key = 'timeline';
  final GetStorage getStorage;

  TimelineDataSource(this.getStorage);

  String _getCurrentDate() {
    var currentTime = DateTime.now();
    final date = '${currentTime.day}-${currentTime.month}-${currentTime.year}';
    return date;
  }

  Future<Map<String, dynamic>> getTimeline() async {
    final Map<String, dynamic> timeline = await getStorage.read(_key) ?? {};
    final date = _getCurrentDate();
    if (timeline[date] == null) {
      timeline[date] = {};
    }
    return timeline;
  }

  Future<void> addTimeline(Place place) async {
    var currentTime = DateTime.now();
    final date = _getCurrentDate();
    final currentTimeline = await getTimeline();
    final currentDate = currentTimeline[date];
    final time = '${currentTime.millisecondsSinceEpoch}';
    if (currentDate.length > 0) {
      if (currentTimeline[date][time] != null) {
        currentTimeline[date][time] = place.toJson();
      } else {
        if (currentTimeline[date] != null) {
          currentTimeline[date][time] = place.toJson();
        } else {
          currentTimeline[date] = {time: place.toJson()};
        }
      }
    } else {
      currentTimeline[date] = {time: place.toJson()};
    }
    return getStorage.write(_key, currentTimeline);
  }
}
