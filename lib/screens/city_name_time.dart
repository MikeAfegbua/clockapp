import 'package:flutter/material.dart';
import 'package:clock_app/core/api/city_time_api.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TestApi test = TestApi();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    var a = await test.getCityData();
    print(a);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF34857b),
      appBar: AppBar(
        backgroundColor: const Color(0xFF34857b),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFF34857b),
        child: const Text('ListView of city and time to select',
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}
