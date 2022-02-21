import 'package:clock_app/screens/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'repeat_widget.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({
    Key? key,
    required this.dueTime,
    required this.onTap,
    required this.switchVal,
    required this.onSwitchChanged,
    required this.onDelete,
  }) : super(key: key);
  final TimeOfDay dueTime;
  final Function() onTap;
  final Function() onDelete;
  final bool switchVal;
  final void Function(bool) onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    buildCollapsed(Color col) {
      return Container(
        height: 70,
        color: col,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                dueTime.format(context), //time renders here
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w100,
                ),
              ),
              onPressed: onTap,
            ),
            Switch(
              value: switchVal,
              activeTrackColor: Colors.yellow.shade200,
              activeColor: Colors.orange.shade400,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
      );
    }

    buildExpandedDefault() {
      return Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.add_alert_sharp,
              color: Colors.white,
            ),
          ),
          const Text(
            '    Default (PianoDance)',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 75,
          ),
          SmallButton(
            ontap: () {},
            width: 20,
            child: const Icon(
              Icons.check,
              color: Colors.black,
              size: 20,
            ),
            innerColor: Colors.orange.shade400,
          ),
          const Text(
            'Vibrate',
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
    }

    buildExpandedLabel() {
      return Row(children: const [
        Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Icon(
            Icons.arrow_forward_outlined,
            color: Colors.white,
          ),
        ),
        Text(
          '    Label',
          style: TextStyle(color: Colors.white),
        ),
      ]);
    }

    buildExpanded() {
      return Container(
        color: Colors.teal,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            buildCollapsed(Colors.teal), //change color when expanded
            const RepeatDays(),
            buildExpandedDefault(),
            buildExpandedLabel()
          ],
        ),
      );
    }

    Widget deleteBuilder = Builder(
      builder: (context) {
        var controller =
            ExpandableController.of(context, rebuildOnChange: true);
        return Padding(
          padding: const EdgeInsets.only(right: 220),
          child: TextButton(
            onPressed: controller!.expanded ? onDelete : () {},
            child: Text(
              controller.expanded ? " \u{1F5D1}   Delete" : "Tomorrow",
              style: const TextStyle(color: Colors.white),
            ),
          ),
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
                  collapsed: buildCollapsed(controller.expanded
                      ? Colors.teal
                      : const Color(0xFF34857b)), //works
                  expanded: buildExpanded(),
                ),
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                      iconColor: Colors.white),
                  header: deleteBuilder,
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
