import 'package:flutter/material.dart';
import 'package:clock_app/core/api/city_time_api.dart';

class CityTimes extends StatefulWidget {
  const CityTimes({Key? key}) : super(key: key);

  @override
  _CityTimesState createState() => _CityTimesState();
}

class _CityTimesState extends State<CityTimes>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TestApi test = TestApi();
  late String akure;
  @override
  void initState() {
    var a = get();
    // ignore: avoid_print
    print(a);

    super.initState();
  }

  dynamic get() async {
    var weatherData = await test.getCityWeather("London");
    return weatherData;
  }

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
              '${DateTime.now()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          const Text('West African Standart Time'),
          ListView(
            shrinkWrap: true,
            children: const [
              Text('Hello'),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Transform.scale(
        scale: 1,
        child: FloatingActionButton(
          backgroundColor: Colors.orange.shade400,
          onPressed: () {
            showDialog(
              barrierColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return const SimpleDialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.only(bottom: 450, left: 100),
                  titlePadding: EdgeInsets.only(left: 100),
                  contentPadding: EdgeInsets.only(left: 100),
                  children: [
                    SizedBox(
                      width: 0,
                      height: 100,
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.ac_unit),
        ),
      ),
    );
  }
}
