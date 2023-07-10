import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time = ' '; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDayTime = true; //true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);
      if (kDebugMode) {
        print(data);
      }

      String datetime = data['datetime'].substring(0, 26);
      DateTime now = DateTime.parse(datetime);
      isDayTime = now.hour > 6 && now.hour  < 19 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      if (kDebugMode) {
        print('caught error: $e');
      }
      time = 'Oops,Something went Wrong!';
    }
  }
}
