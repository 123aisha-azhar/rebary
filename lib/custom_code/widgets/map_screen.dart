// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async'; // For Completer and Future
import 'package:flutter/foundation.dart'; // For ValueNotifier and Factory
import 'package:flutter/material.dart'; // For UI widgets
import 'package:flutter/gestures.dart'; // For gesture recognizers
import 'package:google_maps_flutter/google_maps_flutter.dart'
    as latlng; // Google Maps types
import 'package:location/location.dart'; // For getting user's location
import 'package:cloud_firestore/cloud_firestore.dart';
import '/item_view/item_view_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.width,
    this.height,
    required this.listRef,
    required this.isRun,
  });

  final double? width;
  final double? height;
  final List<ServicesRecord> listRef;
  final bool isRun;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<latlng.GoogleMapController> _controller = Completer();
  final ValueNotifier<Set<latlng.Marker>> markersNotifier = ValueNotifier({});
  Future<latlng.LatLng>? _futureLocation;

  @override
  void initState() {
    super.initState();
    if (widget.isRun) {
      _futureLocation = _getCurrentLocation();
    }
  }

  @override
  void didUpdateWidget(covariant MapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If listRef changed, reload markers
    if (widget.listRef != oldWidget.listRef) {
      _loadMarkers();
    }
  }

  Future<latlng.LatLng> _getCurrentLocation() async {
    final location = Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) serviceEnabled = await location.requestService();

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    if (permissionGranted == PermissionStatus.granted) {
      final locData = await location.getLocation();
      final userLatLng = latlng.LatLng(locData.latitude!, locData.longitude!);

      _loadMarkers();

      return userLatLng;
    }

    return const latlng.LatLng(0, 0); // fallback
  }

  void _loadMarkers() {
    final updatedMarkers = <latlng.Marker>{};

    for (int i = 0; i < widget.listRef.length; i++) {
      if (widget.listRef[i].latlng != null) {
        updatedMarkers.add(
          latlng.Marker(
            markerId: latlng.MarkerId("$i"),
            position: latlng.LatLng(
              widget.listRef[i].latlng!.latitude,
              widget.listRef[i].latlng!.longitude,
            ),
            infoWindow: latlng.InfoWindow(
              title: widget.listRef[i].name,
              onTap: () => _handleMarkerTap(widget.listRef[i]),
            ),
          ),
        );
      }
    }
    markersNotifier.value = updatedMarkers;
  }

  Future<void> _handleMarkerTap(ServicesRecord ref) async {
    await ref.reference.update({
      ...mapToFirestore({'pageview': FieldValue.increment(1)}),
    });

    final reference = await ServicesRecord.getDocumentOnce(ref.reference);

    context.pushNamed(
      ItemViewWidget.routeName,
      queryParameters: {
        'itemsRefrence': serializeParam(reference, ParamType.Document),
      }.withoutNulls,
      extra: {
        'itemsRefrence': reference,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<latlng.LatLng>(
      future: _futureLocation,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final location = snapshot.data!;
        _loadMarkers();

        return SizedBox(
          width: widget.width ?? double.infinity,
          height: widget.height ?? double.infinity,
          key: ValueKey(widget.listRef.length),
          child: ValueListenableBuilder<Set<latlng.Marker>>(
              valueListenable: markersNotifier,
              builder: (context, markers, _) {
                return latlng.GoogleMap(
                  initialCameraPosition: latlng.CameraPosition(
                    target: latlng.LatLng(
                      widget.listRef[0].latlng!.latitude,
                      widget.listRef[0].latlng!.longitude,
                    ),
                    zoom: 17,
                  ),
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  compassEnabled: true,
                  zoomControlsEnabled: true,
                  markers: markers,
                  onMapCreated: (controller) async {
                    _controller.complete(controller);
                    await controller.animateCamera(
                      latlng.CameraUpdate.newCameraPosition(
                        latlng.CameraPosition(
                            target: latlng.LatLng(
                              widget.listRef[0].latlng!.latitude,
                              widget.listRef[0].latlng!.longitude,
                            ),
                            zoom: 17),
                      ),
                    );
                  },
                );
              }),
        );
      },
    );
  }
}
