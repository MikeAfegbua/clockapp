import 'package:clock_app/core/view_models/alarm_manager.dart';
import 'package:clock_app/screens/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/alarm_items.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  _AlarmPageState createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage>
    with AutomaticKeepAliveClientMixin {
  List<Widget> myList = [const AlarmItems()];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    AlarmManager alarmManager =
        Provider.of<AlarmManager>(context, listen: true);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: const Color(0xFF34857b),
      body: Consumer<AlarmManager>(
        builder: (BuildContext context, manager, child) {
          return ListView.builder(
            itemCount: alarmManager.alarmList.length,
            itemBuilder: (context, i) {
              return AlarmTest(
                dueTime: context.read<AlarmManager>().alarmList[i].dueTime!,
                onTap: () async {
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
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                    helpText: '',
                  );

                  if (timeOfAlarm != null && timeOfAlarm != TimeOfDay.now()) {
                    context.read<AlarmManager>().setAlarmTime(
                        timeOfAlarm, alarmManager.alarmList[i].dueTime);
                    // ignore: avoid_print
                    print(timeOfAlarm.format(context));
                    // ignore: avoid_print
                    print(AlarmManager().alarmList[i].dueTime!.format(context));
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
            myList.add(const AlarmItems());
            setState(() {});
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
