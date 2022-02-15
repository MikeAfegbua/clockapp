import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class AlarmItems extends StatefulWidget {
  const AlarmItems({Key? key}) : super(key: key);

  @override
  State<AlarmItems> createState() => _AlarmItemsState();
}

class _AlarmItemsState extends State<AlarmItems> {
  TimeOfDay selectedTime = TimeOfDay.now();
  var controller = ExpandableController();
  bool va = false;

  @override
  Widget build(BuildContext context) {
    buildCollapsed1(Color col) {
      return Container(
        height: 70,
        color: col,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                "${selectedTime.hourOfPeriod}:${selectedTime.minute}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                ),
              ),
              onPressed: () async {
                final TimeOfDay? timeOfDay = await showTimePicker(
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
                  initialTime: selectedTime,
                  initialEntryMode: TimePickerEntryMode.dial,
                  helpText: '',
                );
                if (timeOfDay != null && timeOfDay != selectedTime) {
                  setState(() {
                    selectedTime = timeOfDay;
                  });
                }
              },
            ),
            Switch(
                value: va,
                activeTrackColor: Colors.yellow.shade200,
                activeColor: Colors.orange.shade400,
                onChanged: (val) {
                  va = val;
                  setState(() {});
                }),
          ],
        ),
      );
    }

    buildExpanded1() {
      return Container(
        color: Colors.teal,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCollapsed1(Colors.teal), //change color when expanded
            const ListTile(
              leading: Icon(Icons.ac_unit),
              trailing: Text('Repeat'),
            ),
            const ListTile(
              leading: Icon(Icons.ac_unit),
              trailing: Text('Repeat'),
            ),
            const ListTile(
              leading: Icon(Icons.ac_unit),
              trailing: Text('Repeat'),
            ),
          ],
        ),
      );
    }

    Widget deleteBuilder = Builder(
      builder: (context) {
        var controller =
            ExpandableController.of(context, rebuildOnChange: true);
        return Text(
          controller!.expanded
              ? "\u{1F5D1}  Delete" //pass textbutton delete here
              : "Tomorrow",
          style: const TextStyle(color: Colors.white),
        );
      },
    );

    return ExpandableNotifier(
      //controller: controller,
      child: Builder(
        builder: (context) {
          var controller =
              ExpandableController.of(context, rebuildOnChange: true);
          return Container(
            color: controller!.expanded
                ? Colors.teal
                : const Color(0xFF34857b), //works
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expandable(
                  collapsed: buildCollapsed1(controller.expanded
                      ? Colors.teal
                      : const Color(0xFF34857b)), //works
                  expanded: buildExpanded1(),
                ),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                      iconColor: Colors.white),
                  header: Padding(
                    padding: const EdgeInsets.all(10),
                    child: deleteBuilder,
                    // Text(
                    //   "$w",
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                  ),
                  collapsed: Container(), //might create space under
                  expanded: Container(),
                ),
                const Divider(
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
