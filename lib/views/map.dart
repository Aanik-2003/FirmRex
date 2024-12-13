import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962), // Default position
    zoom: 14.4746,
  );

  Location _location = Location();
  LatLng? _userLocation;
  Set<Marker> _markers = {};

  String? _mapTheme; // Variable to store custom map theme

  // Sample pet shop locations (replace these with real data if needed)
  List<LatLng> _petShopLocations = [
    LatLng(27.7095, 85.3208), // Example pet shop 1
    LatLng(27.7130, 85.3230), // Example pet shop 2
  ];

  TextEditingController _searchController = TextEditingController(); // Controller for the search bar

  int _selectedIndex = 2; // Default index to show the map

  @override
  void initState() {
    super.initState();
    _loadMapStyles();
    _getUserLocation();
  }

  // Load custom map styles
  Future<void> _loadMapStyles() async {
    _mapTheme = await rootBundle.loadString('raw/map.json');
  }

  // Get the user's current location
  Future<void> _getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    // Check if location service is enabled
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) return;
    }

    // Request location permission
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    // Get the current location
    LocationData currentLocation = await _location.getLocation();
    setState(() {
      _userLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
      _markers.add(
        Marker(
          markerId: const MarkerId('user'),
          position: _userLocation!,
          infoWindow: const InfoWindow(title: 'Your Location'),
        ),
      );
    });

    _goToLocation(_userLocation!);
  }

  // Find the nearest pet shop to the user
  void _findNearestPetShop() {
    if (_userLocation == null) return;

    double shortestDistance = double.infinity;
    LatLng nearestPetShop = _petShopLocations[0];

    for (LatLng petShop in _petShopLocations) {
      double distance = _calculateDistance(_userLocation!, petShop);
      if (distance < shortestDistance) {
        shortestDistance = distance;
        nearestPetShop = petShop;
      }
    }

    // Remove any previous nearest pet shop marker
    setState(() {
      _markers.removeWhere((m) => m.markerId.value == 'nearest_pet_shop');
      _markers.add(
        Marker(
          markerId: const MarkerId('nearest_pet_shop'),
          position: nearestPetShop,
          infoWindow: const InfoWindow(title: 'Nearest Pet Shop'),
        ),
      );
    });

    // Move camera to the nearest pet shop
    _goToLocation(nearestPetShop);
  }

  // Calculate the distance between two points (in meters)
  double _calculateDistance(LatLng start, LatLng end) {
    const int radius = 6371000; // Radius of Earth in meters
    double lat1 = start.latitude;
    double lon1 = start.longitude;
    double lat2 = end.latitude;
    double lon2 = end.longitude;

    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);
    double a = (sin(dLat / 2) * sin(dLat / 2)) +
        (cos(_degreesToRadians(lat1)) * cos(_degreesToRadians(lat2)) * sin(dLon / 2) * sin(dLon / 2));
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return radius * c; // Returns distance in meters
  }

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  // Move the camera to a new location
  Future<void> _goToLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newLatLng(location));
  }

  // Method to switch between different views
  Widget _getSelectedView() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: Text('Home View'));
      case 1:
        return Center(child: Text('Explore View'));
      case 2:
        return _buildMapView();
      case 3:
        return Center(child: Text('Manage View'));
      case 4:
        return Center(child: Text('Profile View'));
      default:
        return _buildMapView();
    }
  }

  // Google Map view
  Widget _buildMapView() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kInitialPosition,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        if (_mapTheme != null) {
          controller.setMapStyle(_mapTheme);
        }
      },
    );
  }

  // Handle item tap on Bottom Navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          // Search bar in the app bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: SizedBox(
              width: 350,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality
                      print('Search: ${_searchController.text}');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _getSelectedView(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[200],
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _findNearestPetShop,
        label: const Text('Find Nearest Pet Shop'),
        icon: const Icon(Icons.pets),
      ),
    );
  }
}
