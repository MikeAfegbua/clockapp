import 'package:flutter/material.dart';
import 'package:clock_app/core/api/notifications.dart';

class StopWatch extends StatelessWidget {
  const StopWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: Colors.blue,
      child: Center(
        child: TextButton(
          onPressed: () async {},
          child: const Text('test'),
        ),
      ),
    );
  }
}
