import 'package:geolocator/geolocator.dart';


class Location {
  double latitude;
  double longitude;
  Future<void> getLocation() async{
    try {
      bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
      print('location enabled: $isLocationServiceEnabled');
      LocationPermission permission = await Geolocator.requestPermission();
      print(permission);
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e) {
      print(e);
    }
  }
}

