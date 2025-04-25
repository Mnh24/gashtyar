import 'package:flutter/material.dart';
import 'bottomNavBar.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _scaffoldColorAnimation;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Offset> _containerSlideAnimation;
  late Animation<double> _fadeAnimation;

  final PageController _pageController = PageController();
  int _currentImage = 0;

  final List<String> _images = [
    'assets/images/hotel/HotelRom.jpeg',
    'assets/images/hotel/HotelRom_2.jpeg',
    'assets/images/hotel/HotelRom_3.jpeg',
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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Scaffold(
            backgroundColor: _scaffoldColorAnimation.value,
            body: SafeArea(
              child: SlideTransition(
                position: _containerSlideAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: _containerColorAnimation.value,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(300),
                      bottomLeft: Radius.circular(350),
                    ),
                  ),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: _buildContent(),
                  ),
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
        Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomBottomClipper(),
                  child: SizedBox(
                    height: 460,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      onPageChanged: (index) {
                        setState(() => _currentImage = index);
                      },
                      itemBuilder:
                          (context, index) =>
                              Image.asset(_images[index], fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                Positioned(
                  top: 20,
                  right: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.ios_share_outlined, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.route_rounded, color: Colors.white),
                  ),
                ),
                Positioned(
                  bottom: 65,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.route_rounded, color: Colors.white),
                          Text(
                            '34m²',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Lenas\nDonau Hotel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 6,
                          ),
                          child: Text(
                            "72k Reviews",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Wake Up to Paradise',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Donau Elegance',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _infoChips(),
                      const SizedBox(height: 10),
                      _featureIcons(),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 376,
          right: 20,
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            child: Icon(Icons.star_border, color: Colors.white, size: 40),
          ),
        ),
        Positioned(
          bottom: 432,
          left: MediaQuery.of(context).size.width / 2 - 15,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: List.generate(
                _images.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentImage == index
                            ? const Color.fromARGB(
                              221,
                              44,
                              226,
                              153,
                            ).withOpacity(0.8)
                            : const Color.fromARGB(255, 123, 123, 123),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 20,
          right: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Text('From', style: TextStyle(fontSize: 15)),
                  Text('\$80/night', style: TextStyle(fontSize: 20)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 119, 195, 130),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Book Now',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 20,
          right: 20,
          child: BottomNavBar(currentIndex: 4),
        ),
      ],
    );
  }

  Widget _infoChips() {
    return Row(
      children: [
        _infoBox(Icons.location_on, "1km to centre"),
        const SizedBox(width: 10),
        _infoBox(Icons.people, "2"),
        const SizedBox(width: 10),
        _infoBox(Icons.calendar_today, "10 days"),
      ],
    );
  }

  Widget _featureIcons() {
    return Row(
      children: [
        _featureBox(Icons.bed, "1 king bed"),
        const SizedBox(width: 10),
        _featureBox(Icons.wifi, "Free wi-fi"),
        const SizedBox(width: 10),
        _featureBox(Icons.tv, "TV"),
      ],
    );
  }

  Widget _infoBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black),
          const SizedBox(width: 5),
          Text(text, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }

  Widget _featureBox(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 44, 226, 153).withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(height: 5),
          Text(text, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class CustomBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 70,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
