import 'package:flutter/material.dart';

import 'bottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late AnimationController _controller;
  late Animation<Color?> _scaffoldColorAnimation;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Offset> _containerSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _scaffoldColorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 255, 255, 255),
      end: const Color.fromARGB(255, 232, 242, 226),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerColorAnimation = ColorTween(
      begin: const Color(0xFF1D2B1F),
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerSlideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
          child: Scaffold(
            backgroundColor: _scaffoldColorAnimation.value,
            body: SlideTransition(
              position: _containerSlideAnimation,
              child: Container(
                decoration: BoxDecoration(
                  color: _containerColorAnimation.value,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(300),
                    bottomLeft: Radius.circular(330),
                  ),
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: _buildContent(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Positioned(
          top: 4,
          left: 10,
          right: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        Positioned(
          bottom: 70,
          left: -20,
          right: -20,
          child: ClipOval(
            child: Container(
              height: 500,
              width: 500,
              child: Image.asset(
                'assets/images/HomeScreen/forest.jpeg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 320,
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
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "The Sounds of Nature",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "A real adventure where nature\nreveals its grandeur and beauty in its purest form.",
                  style: TextStyle(fontSize: 13, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
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
          bottom: 10,
          left: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: BottomNavBar(currentIndex: _currentIndex),
          ),
        ),
      ],
    );
  }
}

Widget _tab(String title, bool isActive) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: isActive ? Colors.white : Colors.black,
      backgroundColor: isActive ? const Color(0xFF1D2B1F) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      elevation: 0,
    ),
    onPressed: () {},
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
}
