import 'package:flutter/material.dart';
import 'package:gashtyar/main.dart';
import 'DestinationScreen.dart';
import 'HomeScreen.dart'; // Important to import MainNavigationScreen
import 'FlightSearchPage.dart';
import 'HotelDetailsPage.dart'; // Also import FlightSearchPage

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  const BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  void _onItemTapped(int index) {
    // if (index == widget.currentIndex) return; // If already selected, do nothing
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DestinationScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FlightSearchPage()),
      );
    } else if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HotelDetailsPage()),
      );
    }
    // Add more navigation if you add more screens later
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1D2B1F),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavIcon(Icons.home, 0),
          _bottomNavIcon(Icons.grid_view_rounded, 1),
          _bottomNavIcon(Icons.route_rounded, 2),
          _bottomNavIcon(Icons.flight_takeoff, 3),
          _bottomNavIcon(Icons.hotel, 4),
          const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/profiles/yavuz.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color:
            widget.currentIndex == index
                ? const Color.fromARGB(255, 119, 195, 130)
                : Colors.grey.shade400,
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
