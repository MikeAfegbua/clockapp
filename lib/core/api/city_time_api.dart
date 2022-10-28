// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}

class TestApi {
  Future<dynamic> getCityData() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://worldtimeapi.org/api/timezone/Europe/paris');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  void getInfo() {}
}
