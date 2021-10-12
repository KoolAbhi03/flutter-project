import 'package:http/http.dart';
import 'dart:convert';

class GetLocation {
  String query;
  dynamic lat;
  dynamic lon;
  GetLocation({this.query});
  Future<void> getlocation() async {
    query = query.toUpperCase();
    Response response = await get('https://geocode.xyz/$query?geoit=json');
    Map data = jsonDecode(response.body);
    lon = data['longt'];
    lat = data['latt'];
  }
}

/*void main() {
  GetLocation getLocation = GetLocation(query: 'gaya');
  getLocation.getlocation();
}*/
