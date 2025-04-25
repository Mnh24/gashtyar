import 'package:flutter/material.dart';
import 'HotelDetailsPage.dart';
import 'bottomNavBar.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _scaffoldColorAnimation;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Offset> _containerSlideAnimation;
  late Animation<double> _fadeAnimation;

  final destinations = [
    ["Shangri-La's", "", "assets/images/hotel/hotelParadise.jpeg"],
    ["SWITZERLAND", "Emerald Pass", "assets/images/Countries/switzerland.jpg"],
    ["CANADA", "Summit Serenity", "assets/images/Countries/canada.jpeg"],
    ["NEW ZEALAND", "", "assets/images/Countries/nz.jpeg"],
    ["AUSTRIA", "", "assets/images/Countries/austria.jpeg"],
    ["Turkey", "Istanbul", "assets/images/Countries/Istanbul.jpeg"],
    ["Turkey", "Bosphorus", "assets/images/Countries/IstanbulBosphorus.jpeg"],
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaffoldColorAnimation = ColorTween(
      begin: const Color(0xFFFFFFFF),
      end: const Color.fromARGB(255, 232, 242, 226),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerColorAnimation = ColorTween(
      begin: Colors.white,
      end: const Color.fromARGB(255, 232, 242, 226),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
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
        return Scaffold(
          backgroundColor: _scaffoldColorAnimation.value,
          body: SafeArea(
            child: SlideTransition(
              position: _containerSlideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _buildContent(),
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleIcon(Icons.tune),
                  _circleIcon(Icons.star_border),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "Select",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "destination",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _categoryChips(),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: destinations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HotelDetailsPage(),
                          ),
                        );
                      },
                      child: DestinationCard(
                        country: destinations[index][0],
                        title: destinations[index][1],
                        imagePath: destinations[index][2],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        const Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: BottomNavBar(currentIndex: 1),
        ),
      ],
    );
  }

  Widget _circleIcon(IconData icon) => CircleAvatar(
    radius: 30,
    backgroundColor: Colors.white,
    child: Icon(icon, color: Colors.black, size: 30),
  );

  Widget _categoryChips() {
    final categories = [
      ["Hiking", Icons.hiking],
      ["Hotels", Icons.hotel],
      ["Kayaking", Icons.sailing],
      ["Biking", Icons.directions_bike],
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            categories.map((cat) {
              return Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Text(
                      cat[0] as String,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(width: 10),
                    Icon(cat[1] as IconData, size: 16, color: Colors.black),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final String country;
  final String title;
  final String imagePath;

  const DestinationCard({
    super.key,
    required this.country,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black38,
            ),
            child: const Icon(Icons.star_border, color: Colors.white),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                country,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
