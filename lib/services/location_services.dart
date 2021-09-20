import 'dart:async';

import 'package:commutifyy/data_modals/user_location.dart';
import 'package:location/location.dart';

List longitudes = [];
List latitude = [];

class LocationService {
  //keep track of current location
  UserLocation _currentlocation;
  var location = Location();
  //Continuosly emit location updates
  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();
  LocationService() {
    location.requestPermission().then((grantedd) {
      if (grantedd != null) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            latitude.add(locationData.latitude);
            longitudes.add(locationData.longitude);
            _locationController.add(UserLocation(
                longitude: locationData.longitude,
                latitude: locationData.latitude,
                lat: latitude,
                long: longitudes));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userlocation = await location.getLocation();
      _currentlocation = UserLocation(
          latitude: userlocation.latitude, longitude: userlocation.longitude);
    } catch (e) {
      print("there some issue rk :$e");
    }
    return _currentlocation;
  }
}
