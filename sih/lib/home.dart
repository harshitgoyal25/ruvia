import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'widgets/floating_profile_button.dart';
import 'widgets/bottomBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedBottomIndex = 0;
  LatLng? _currentLatLng;
  final LatLng _defaultLocation = LatLng(22.7196, 75.8577); // Indore fallback

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );

      if (!mounted) return;
      setState(() {
        _currentLatLng = LatLng(pos.latitude, pos.longitude);
      });
    } catch (_) {
      // fallback silently
    }
  }

  void _onBottomNavSelect(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final center = _currentLatLng ?? _defaultLocation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 15, 12),
        elevation: 3,
        title: const Text(
          "Ruvia",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Color.fromARGB(255, 99, 227, 82),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Color.fromARGB(255, 99, 227, 82),
          ),
          onPressed: () {
            // TODO: handle notification tap
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: FloatingProfileButton(
              userName: "Harsh Kumar",
              avatarImage: "assets/avator.png",
            ),
          ),
        ],
      ),

      body: FlutterMap(
        options: MapOptions(
          initialCenter: center,
          initialZoom: 13.0,
          minZoom: 3,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'your.app.package',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: center,
                width: 120,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'You',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedBottomIndex,
        onTap: _onBottomNavSelect,
      ),
    );
  }
}
