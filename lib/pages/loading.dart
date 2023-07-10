import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'India', flag: 'india.png', url: 'Asia/Kolkata');
    await instance.getTime();
    
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFadingCube(
          color: Color.fromARGB(255, 77, 75, 75),
          size: 50.0,
        ),
      ),
    );
  }
}
