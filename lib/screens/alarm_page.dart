import 'package:clock_app/core/api/notifications.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/core/view_models/alarm_manager.dart';
import 'package:provider/provider.dart';
import 'widgets/alarm_items.dart';
//import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xFF34857b),
      body: Consumer<AlarmManager>(
        builder: (BuildContext context, manager, child) {
          return ListView.builder(
            itemCount: manager.alarmList.length,
            itemBuilder: (context, i) {
              return AlarmWidget(
                dueTime: manager.alarmList[i].dueTime!,
                onDelete: () {
                  manager.removeTime(i);
                },
                onTap: () async {
                  TimeOfDay? time = await manager.pickAlarm(context, i);
                  context.read<AlarmManager>().setAlarmTime(time, i);
                  //shows time picker and creates time
                },
                switchVal: manager.alarmList[i].isActive,
                onSwitchChanged: (switchVal) async {
                  manager.toggleSwitch(i);

                  if (switchVal == true) {
                    var text =
                        'Alarm set for ${manager.alarmList[i].dueTime!.format(context)}';
                    var snackInfo = SnackBar(
                        content: Text(text),
                        duration: const Duration(milliseconds: 2000));
                    ScaffoldMessenger.of(context).showSnackBar(snackInfo);

                    createAlarmNotification(manager.getTime);
                  }
                },
              );
            },
          );
        },
      ),
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
          backgroundColor: Colors.orange.shade400,
          onPressed: () {
            context.read<AlarmManager>().addNewTime(context);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
