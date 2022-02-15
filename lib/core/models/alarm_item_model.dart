import 'package:flutter/material.dart';

class AlarmModel {
  bool isActive;
  TimeOfDay? dueTime;
  dynamic selectedTune;
  bool willVibrate;
  DateTime repeatDays;
  String repeatText;
  String labelText;

  AlarmModel({
    required this.isActive,
    required this.dueTime,
    required this.labelText,
    required this.repeatDays,
    required this.repeatText,
    required this.willVibrate,
    this.selectedTune,
  });
}
