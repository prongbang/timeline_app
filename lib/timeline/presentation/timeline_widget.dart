import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timeline/timeline/domain/add_timeline_usecase.dart';
import 'package:timeline/timeline/domain/get_timeline_usecase.dart';
import 'package:timeline/timeline/domain/place.dart';

class TimelineWidget extends StatefulWidget {
  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<Map<String, dynamic>>(
                future: GetIt.I.get<GetTimelineUseCase>().execute(null),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final timeline = snapshot.data.entries.toList();
                  return Stepper(
                    currentStep: _index,
                    physics: ClampingScrollPhysics(),
                    onStepCancel: () {
                      if (_index <= 0) {
                        return;
                      }
                      setState(() {
                        _index--;
                      });
                    },
                    onStepContinue: () {
                      if (_index >= 1) {
                        return;
                      }
                      setState(() {
                        _index++;
                      });
                    },
                    onStepTapped: (index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    controlsBuilder:
                        (context, {onStepCancel, onStepContinue}) => SizedBox(),
                    steps: [
                      for (var t in timeline)
                        Step(
                          title: Text(t.key),
                          content: Column(
                            children: [
                              for (var index = 0;
                                  index < t.value.entries.length;
                                  index++)
                                ListTile(
                                  title: Text(
                                    t.value.values.toList()[index]['name'],
                                  ),
                                  subtitle: Text(
                                    t.value.keys.toList()[index],
                                  ),
                                ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ElevatedButton.icon(
              onPressed: () async {
                await GetIt.I
                    .get<AddTimelineUseCase>()
                    .execute(Place(name: 'Test'));
              },
              // icon: Icon(Icons.add),
              icon: Icon(Icons.add),
              label: Text('Check In'),
            ),
          ),
        ],
      ),
    );
  }
}
