import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'HomePage.dart';

class MapScreen extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final LatLng _center = LatLng(HomePage.lat, HomePage.lon);
  MapScreen(this.documents);
  final double lat = 10.0;
  final double lon = 10.0;
  Completer<GoogleMapController> mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40576E),
      body: SafeArea(
              child: GoogleMap(
          onMapCreated: (mapController) {
            this.mapController.complete(mapController);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition:
              CameraPosition(target: _center, zoom: 15.0),
                  markers: documents
                      .map((values) {
                        return Marker(
                          position: LatLng(
                              values.data['latitude'], values.data['longitude']
                          ),
                          markerId: MarkerId(values.data['name']),
                          onTap: () {},
                          icon: BitmapDescriptor.defaultMarkerWithHue(200),
                          infoWindow: InfoWindow(
                              title: values.data['name'],
                              snippet: values.data['isOpen'] ?? 'Open Now',
                              onTap: () {}),
                        );
                      }
                      )
                      .toSet(),
        ),
      ),
    );
  }
}
