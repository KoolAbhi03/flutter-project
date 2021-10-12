import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/getinfo.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWeather() async {
    try {
      GetInfo getInfo = GetInfo(latt: 24.7948, longt: 84.9829);
      await getInfo.getinfo();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temp': getInfo.temp,
        'tempmax': getInfo.tempmax,
        'tempmin': getInfo.tempmin,
        'status': getInfo.status,
        'name': getInfo.name,
        'icon': getInfo.icon,
        'realtemp': getInfo.realtemp
      });
    } catch (e) {
      Navigator.pushNamed(context, '/error');
    }
  }

  @override
  void initState() {
    super.initState();
    setupWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.lightBlueAccent[200],
          size: 50,
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
