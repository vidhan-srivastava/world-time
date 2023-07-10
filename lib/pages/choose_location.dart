import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> location = [
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.webp'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'jakarta.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'london.avif'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'nairobi.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'chicago.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'new_york.webp'),
  ]; 

  void updateTime(index) async {
    WorldTime instance = location[index];
    await instance.getTime();
    //navigate to home screen
    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
       'location': instance.location, 
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 34, 58, 86),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose A Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(location[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${location[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
