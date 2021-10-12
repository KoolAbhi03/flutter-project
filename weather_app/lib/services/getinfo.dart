import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class GetInfo {
  String icon;
  dynamic realtemp;
  dynamic name;
  dynamic temp;
  dynamic tempmin;
  dynamic tempmax;
  String status;
  dynamic latt;
  dynamic longt;
  GetInfo({this.latt, this.longt});
  Future<void> getinfo() async {
    try {
      Response response = await get(
          'https://fcc-weather-api.glitch.me/api/current?lat=$latt&lon=$longt');
      Map data = jsonDecode(response.body);
      temp = data['main']['temp'];
      tempmin = data['main']['temp_min'];
      tempmax = data['main']['temp_max'];
      status = data['weather'][0]['main'];
      name = data['name'];
      icon = data['weather'][0]['icon'];
      realtemp = data['main']['feels_like'];
    } catch (e) {}
  }
}

/*void main() {
  GetInfo getInfo = GetInfo(latt: 24.7948, longt: 84.9829);
  getInfo.getinfo();
}*/
