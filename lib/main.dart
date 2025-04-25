import 'package:flutter/material.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DestinationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        232,
        242,
        226,
      ), // Background color for the entire screen
      body: Container(
        decoration: BoxDecoration(
          color:
              Colors
                  .white, // Background color for the body to see the border radius effect
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(300),
            bottomLeft: Radius.circular(330),
          ),
        ),

        child: Stack(
          children: [
            Positioned(
              top: 4,
              left: 10,
              right: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 40),
                        Text(
                          "Hi, Mohammed 👋",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "🇳🇴 NORWAY",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.amber,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Weather\n15°C",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 10,
              right: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Nature\nPower",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.search, size: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // Image inside the circle
            Positioned(
              bottom: 70,
              left: -20,
              right: -20,
              child: ClipOval(
                child: Container(
                  height: 500, // Circle height
                  width:
                      500, // Circle width (same as height for a perfect circle)
                  child: Positioned.fill(
                    child: Image.asset(
                      'assets/images/HomeScreen/forest.jpeg', // Your image path
                      fit:
                          BoxFit
                              .fill, // Make sure the image covers the available space
                    ),
                  ),
                ),
              ),
            ),
            // Text on top of the image (inside the circle)
            Positioned(
              top:
                  320, // Adjust the top position to place the button at the top
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _tab("Hiking", true),
                      const SizedBox(width: 8),
                      _tab("Kayaking", false),
                      const SizedBox(width: 8),
                      _tab("Biking", false),
                      const SizedBox(width: 8),
                      _tab("Hiking", false),
                      const SizedBox(width: 8),
                      _tab("Kayaking", false),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: 50,
              right: 50,
              child: Padding(
                padding: const EdgeInsets.all(24), // Padding around the text
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Center the content vertically
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "The Sounds of Nature",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "A real adventure where nature\nreveals its grandeur and beauty in its purest form.",
                      style: TextStyle(fontSize: 13, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20,
                    ), // Space between the image and the button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ), // Padding for the button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Text(
                            "Start Trip",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom:
                  10, // Adjust the top position to place the button at the top
              left: 20,
              right: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFF1D2B1F,
                    ), // Dark background for the bottom navigation
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _bottomNavIcon(Icons.home, 0),
                      _bottomNavIcon(Icons.grid_view_rounded, 1),
                      _bottomNavIcon(Icons.cable, 2),
                      _bottomNavIcon(Icons.calendar_month_outlined, 3),
                      CircleAvatar(
                        radius: 18,
                        backgroundImage: AssetImage(
                          'assets/images/profiles/yavuz.jpg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavIcon(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        size: 30,
        icon,
        color:
            _currentIndex == index
                ? const Color(0xFFCEE741)
                : Colors.grey.shade400,
      ),
      onPressed: () {
        setState(() => _currentIndex = index);

        if (index == 2) {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Nextscreen()),
          // );
        }
      },
    );
  }
}

class DestinationsScreen extends StatelessWidget {
  const DestinationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Destinations Page", style: TextStyle(fontSize: 24)),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Page", style: TextStyle(fontSize: 24)),
    );
  }
}

Widget _tab(String title, bool isActive) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: isActive ? Colors.white : Colors.black,
      backgroundColor:
          isActive ? const Color(0xFF1D2B1F) : Colors.white, // Text color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 16,
      ), // Padding inside button
      elevation: 0, // No shadow for flat design
    ),
    onPressed: () {},
    child: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold, // Bold text
      ),
    ),
  );
}
