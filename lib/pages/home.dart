import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data:  ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';
    Color bgColor = data['isDayTime']
        ? const Color.fromARGB(255, 23, 137, 231)
        : Colors.black;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                     await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: const Text(
                    'EDIT LOCATION',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 120.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 40.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
