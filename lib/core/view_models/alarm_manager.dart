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

  void addNewTime(BuildContext context) async {
    final TimeOfDay? timeOfAlarm = await showTimePicker(
      context: context,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                height: 500,
                child: child,
              ),
            ),
          ],
        );
      },
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now().add(
          const Duration(minutes: 1),
        ),
      ),
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: '',
    );
    alarmList.add(
      AlarmModel(
          isActive: false,
          dueTime: timeOfAlarm,
          labelText: '',
          repeatDays: DateTime.now(),
          repeatText: 'Monday',
          willVibrate: false),
    );
    notifyListeners();
  }

  void removeTime(int i) {
    alarmList.removeAt(i);

    notifyListeners();
  }

  void toggleSwitch(int i) {
    alarmList[i].isActive = !alarmList[i].isActive;

    notifyListeners();
  }

  Future<TimeOfDay?> pickAlarm(BuildContext context, int i) async {
    final TimeOfDay? timeOfAlarm = await showTimePicker(
      context: context,
      builder: (context, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                height: 500,
                child: child,
              ),
            ),
          ],
        );
      },
      initialTime: TimeOfDay.fromDateTime(
        DateTime.now().add(
          const Duration(minutes: 1),
        ),
      ),
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: '',
    );

    if (timeOfAlarm != null && timeOfAlarm != TimeOfDay.now()) {
      alarmList[i].dueTime = timeOfAlarm;
      notifyListeners();
      return timeOfAlarm;
      //manager = Provider.of<AlarmManager>(context, listen:false).

    }
    return null;
  }

  TimeOfDay actualTime = TimeOfDay.now();

  TimeOfDay get getTime {
    return actualTime;
  }

  void setAlarmTime(TimeOfDay? timeOfAlarm, int i) {
    if (timeOfAlarm != null) {
      actualTime = timeOfAlarm;
    }

    notifyListeners();
  }
}
