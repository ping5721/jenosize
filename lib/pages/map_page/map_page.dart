import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key, required this.title, required this.latLng})
      : super(key: key);

  final String title;
  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: latLng,
          zoom: 20,
        ),
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}
