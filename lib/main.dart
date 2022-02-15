import 'package:clock_app/core/view_models/alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/app/theme.dart';
import 'package:clock_app/screens/stop_watch.dart';
import 'package:clock_app/screens/alarm_page.dart';
//import 'package:clock_app/screens/timer_page.dart';
import 'package:clock_app/screens/city_times_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: mytheme(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AlarmManager(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 10,
            backgroundColor: const Color(0xFF34857b),
            bottom: const TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: Icon(Icons.alarm),
                ),
                Tab(
                  icon: Icon(Icons.access_time_rounded),
                ),
                Tab(
                  icon: Icon(Icons.hourglass_bottom),
                ),
                Tab(
                  icon: Icon(Icons.timer_outlined),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AlarmPage(),
              CityTimes(),
              ExpansionListView(),
              CityTimes()
            ],
          ),
        ),
      ),
    );
  }
}
