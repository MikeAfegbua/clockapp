import 'package:flutter/material.dart';
import 'package:clock_app/screens/widgets/small_button.dart';

class RepeatDays extends StatefulWidget {
  const RepeatDays({Key? key}) : super(key: key);

  @override
  State<RepeatDays> createState() => _RepeatDaysState();
}

class _RepeatDaysState extends State<RepeatDays> {
  void addDays() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: addDays,
          //radius: ,
          child: Row(
            children: [
              SmallButton(
                ontap: addDays,
                width: 20,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 20,
                ),
                innerColor: isVisible
                    ? Colors.orange.shade400
                    : const Color(0xFF34857b),
              ),
              const Text(
                'Repeat',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Visibility(visible: isVisible, child: const DaysRow()),
      ],
    );
  }
}

class DaysRow extends StatelessWidget {
  const DaysRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'S',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'M',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'T',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'W',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'T',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'F',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
        SmallButton(
          ontap: () {},
          width: 50,
          child: const SizedBox(
            width: 22,
            height: 27,
            child: Center(
              child: Text(
                'S',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          innerColor: Colors.orange.shade400,
        ),
      ],
    );
  }
}
