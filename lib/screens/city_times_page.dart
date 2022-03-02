import 'package:clock_app/screens/city_name_time.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class CityTimes extends StatefulWidget {
  const CityTimes({Key? key}) : super(key: key);

  @override
  _CityTimesState createState() => _CityTimesState();
}

class _CityTimesState extends State<CityTimes>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFF34857b),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              TimeOfDay.now().format(context),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Text(
            DateFormat("EEE, MMM d").format(DateTime.now()),
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          // ignore: unnecessary_string_interpolations
          const Text(
            "West Africa Standard Time", //DateTime.now().timeZoneName,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          ListView(
            shrinkWrap: true,
            children: const [
              Center(
                child: Text(
                  'Hello',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.orange.shade400,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const TimePicker();
                },
              ),
            );
          },
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}

// showDialog(
//               barrierColor: Colors.transparent,
//               context: context,
//               builder: (BuildContext context) {
//                 return const SimpleDialog(
//                   elevation: 0,
//                   insetPadding: EdgeInsets.only(bottom: 450, left: 100),
//                   titlePadding: EdgeInsets.only(left: 100),
//                   contentPadding: EdgeInsets.only(left: 100),
//                   children: [
//                     SizedBox(
//                       width: 0,
//                       height: 100,
//                     ),
//                   ],
//                 );
//               },
//             );