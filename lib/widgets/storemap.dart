import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreMap extends StatelessWidget {
  final double lat;
  final double lon;
  final String storeName;
  final String isOpen;
  StoreMap(this.lat, this.lon, this.storeName, this.isOpen);

  @override
  Widget build(BuildContext context) {
    final LatLng _center = LatLng(lat, lon);
    return GoogleMap(
      // cameraTargetBounds: CameraTargetBounds(LatLngBounds(southwest: null, northeast: null)),
      scrollGesturesEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 15.0,
      ),
      markers: {
        Marker(
            markerId: MarkerId(storeName),
            icon: BitmapDescriptor.defaultMarkerWithHue(200),
            position: LatLng(lat, lon),
            infoWindow: InfoWindow(title: storeName, snippet: 'Open Now')),
      },
    );
  }
}
