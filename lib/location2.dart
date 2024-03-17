import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MapDirectionScreen());
}

class MapDirectionScreen extends StatefulWidget {
  @override
  _MapDirectionScreenState createState() => _MapDirectionScreenState();
}

class _MapDirectionScreenState extends State<MapDirectionScreen> {
  Position? _currentPosition; // Make currentPosition nullable

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Method to fetch the user's current location
  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Location'),
        ),
        body: Center(
          child: _currentPosition != null
              ? GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      _currentPosition!.latitude,
                      _currentPosition!.longitude,
                    ),
                    zoom: 14.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('userLocation'),
                      position: LatLng(
                        _currentPosition!.latitude,
                        _currentPosition!.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: 'Your Location',
                        snippet:
                            'Latitude: ${_currentPosition!.latitude}, Longitude: ${_currentPosition!.longitude}',
                      ),
                    ),
                  },
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
