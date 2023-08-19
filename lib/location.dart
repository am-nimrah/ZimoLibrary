import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location App',
      theme: ThemeData(
        fontFamily: 'Lato', // Set the default font to Lato
      ),
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _location;

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        getLocation();
      } else {
        print('Location permission denied');
      }
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      getLocation();
    }
  }

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _location = position;
      });
    } catch (error) {
      print('Error getting location: $error');
    }
  }

  Future<void> openMaps() async {
    if (_location != null) {
      final mapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${_location!.latitude},${_location!.longitude}';
      if (await canLaunch(mapsUrl)) {
        await launch(mapsUrl);
      } else {
        print('Could not launch $mapsUrl');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Location',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            if (_location != null)
              Column(
                children: [
                  Text('Latitude: ${_location!.latitude}'),
                  Text('Longitude: ${_location!.longitude}'),
                ],
              ),
            ElevatedButton(
              onPressed: getLocation,
              child: Text('Get Location'),
            ),
            SizedBox(height: 20),
            if (_location != null)
              ElevatedButton(
                onPressed: openMaps,
                child: Text('Open Maps'),
              ),
          ],
        ),
      ),
    );
  }
}
