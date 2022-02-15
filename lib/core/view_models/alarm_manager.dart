import 'package:flutter/material.dart';
import 'package:clock_app/core/models/alarm_item_model.dart';

class AlarmManager extends ChangeNotifier {
  List<AlarmModel> alarmList = [
    AlarmModel(
        isActive: false,
        dueTime: TimeOfDay.now(),
        labelText: '',
        repeatDays: DateTime.now(),
        repeatText: 'Monday',
        willVibrate: false),
  ];

  int get alarmLength {
    return alarmList.length;
  }

  void setAlarmTime(TimeOfDay? timeOfAlarm, TimeOfDay? timeOf) {
    timeOf = timeOfAlarm;

    notifyListeners();
  }
}
