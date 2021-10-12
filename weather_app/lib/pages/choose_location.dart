import 'package:flutter/material.dart';
import 'package:weather_app/services/getLocation.dart';
import 'package:weather_app/services/getinfo.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String loc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.black),
            onChanged: (task) {
              setState(() {
                if (task != '' || task != null) {
                  loc = task;
                }
              });
            },
            autofocus: false,
            decoration: new InputDecoration(
                labelText: 'Enter Location',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'eg. Gaya',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          FlatButton(
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() async {
                if (loc != '' || loc != null) {
                  GetLocation getLocation = GetLocation(query: loc);
                  await getLocation.getlocation();
                  GetInfo getInfo =
                      GetInfo(latt: getLocation.lat, longt: getLocation.lon);
                  await getInfo.getinfo();
                  Navigator.pop(context, {
                    'temp': getInfo.temp,
                    'tempmax': getInfo.tempmax,
                    'tempmin': getInfo.tempmin,
                    'status': getInfo.status,
                    'name': getInfo.name,
                    'icon': getInfo.icon,
                    'realtemp': getInfo.realtemp
                  });
                }
              });
            },
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
