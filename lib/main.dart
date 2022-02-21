import 'package:clock_app/core/view_models/alarm_manager.dart';
import 'package:clock_app/screens/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/app/theme.dart';
import 'package:clock_app/screens/stop_watch.dart';
import 'package:clock_app/screens/alarm_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:clock_app/screens/city_times_page.dart';
import 'package:provider/provider.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: '',
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        channelDescription: 'myChannel',
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
      ),
    ],
  );
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
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });
  }

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
              StopWatch(),
              TimerPage(),
            ],
          ),
        ),
      ),
    );
  }
}
