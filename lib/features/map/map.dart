import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// A simple data model for a DWLR station
class DwlrStation {
  final String id;
  final String status;
  final LatLng position;
  final BitmapDescriptor icon;

  DwlrStation({
    required this.id,
    required this.status,
    required this.position,
    required this.icon,
  });
}

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // The GoogleMapController for programmatic map control
  GoogleMapController? _mapController;
  // The set of markers to be displayed on the map
  final Set<Marker> _markers = {};
  // The initial camera position, centered on India
  static const LatLng _initialPosition = LatLng(22.5937, 78.9629);

  // --- Dummy Data ---
  // In a real app, this list would be fetched from your API
  final List<DwlrStation> _dwlrStations = [
    DwlrStation(
        id: 'PB-0172',
        status: 'Over-Exploited',
        position: const LatLng(30.7333, 76.7794),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
    DwlrStation(
        id: 'TN-0453',
        status: 'Critical',
        position: const LatLng(11.0778, 76.9585),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)),
    DwlrStation(
        id: 'MH-1102',
        status: 'Semi-Critical',
        position: const LatLng(18.5204, 73.8567),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)),
    DwlrStation(
        id: 'OD-0981',
        status: 'Safe',
        position: const LatLng(20.2961, 85.8245),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)),
    DwlrStation(
        id: 'RJ-0341',
        status: 'Over-Exploited',
        position: const LatLng(26.9124, 75.7873),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
    DwlrStation(
        id: 'KA-2109',
        status: 'Critical',
        position: const LatLng(12.9716, 77.5946),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)),
     DwlrStation(
        id: 'UP-5521',
        status: 'Safe',
        position: const LatLng(26.8467, 80.9462),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)),
     DwlrStation(
        id: 'GJ-0876',
        status: 'Semi-Critical',
        position: const LatLng(23.0225, 72.5714),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow)),
  ];

  @override
  void initState() {
    super.initState();
    // When the widget is initialized, convert the list of stations into map markers
    _createMarkers();
  }

  void _createMarkers() {
    // Iterate over the station data and create a Marker for each one
    for (var station in _dwlrStations) {
      final marker = Marker(
        markerId: MarkerId(station.id),
        position: station.position,
        icon: station.icon,
        infoWindow: InfoWindow(
          title: 'Station ID: ${station.id}',
          snippet: 'Status: ${station.status}',
        ),
      );
      // Add the newly created marker to the set of markers
      _markers.add(marker);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DWLR Station Map'),
        backgroundColor: const Color(0xFF0D47A1),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('API needed to fetch real DWLR station data',
                style: Theme.of(context).textTheme.titleLarge),
            GoogleMap(
            
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 5.0, // Zoom level to show the whole country
              ),
              markers: _markers,
              mapType: MapType.terrain, // Terrain view is good for geographical data
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
