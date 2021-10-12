import 'package:flutter/material.dart';
import 'package:weather_app/services/getLocation.dart';
import 'package:weather_app/services/getinfo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    if (data.isEmpty) {
      Navigator.pushNamed(context, '/error');
    }

    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: Column(
            children: [
              // edit, name and reload
              Stack(
                children: [
                  // edit location button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        if (result != null) {
                          setState(() {
                            data = {
                              'name': result['name'],
                              'status': result['status'],
                              'tempmin': result['tempmin'],
                              'tempmax': result['tempmax'],
                              'temp': result['temp'],
                              'icon': result['icon']
                            };
                          });
                        }
                      },
                    ),
                  ),
                  //location name
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text('${data['name']}',
                          style: TextStyle(color: Colors.white, fontSize: 26)),
                    ),
                  ),
                  // update data button
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          Icons.replay_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() async {
                            GetLocation getLocation =
                                GetLocation(query: data['name']);
                            await getLocation.getlocation();
                            GetInfo getInfo = GetInfo(
                                latt: getLocation.lat, longt: getLocation.lon);
                            await getInfo.getinfo();
                            data = {
                              'name': getInfo.name,
                              'status': getInfo.status,
                              'tempmin': getInfo.tempmin,
                              'tempmax': getInfo.tempmax,
                              'temp': getInfo.temp,
                              'icon': getInfo.icon,
                              'realtemp': getInfo.realtemp
                            };
                          });
                        },
                      )),
                ],
              ),
              // temp and deg C
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // temp data
                    Text(
                      '${data['temp']}',
                      style: TextStyle(color: Colors.white, fontSize: 90),
                    ),
                    // deg C
                    Container(
                      height: 75,
                      child: Text('°C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              // status
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('${data['icon']}'),
                  // weather status

                  Text(
                    '${data['status']}',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
              // Card for rest details
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  width: 400,
                  height: 410,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Feels Like : ${data['realtemp']} °C',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Min : ${data['tempmin']} °C',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Max : ${data['tempmax']} °C',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
