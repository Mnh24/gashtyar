import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bottomNavBar.dart';

class HotelDetailsPage extends StatefulWidget {
  const HotelDetailsPage({super.key});

  @override
  State<HotelDetailsPage> createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  final PageController _pageController = PageController();
  int _currentImage = 0;

  final List<String> _images = [
    'assets/images/hotel/HotelRom.jpeg',
    'assets/images/hotel/HotelRom_2.jpeg',
    'assets/images/hotel/HotelRom_3.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(232, 211, 243, 165),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: SizedBox(
                        height: 450,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: _images.length,
                          onPageChanged: (index) {
                            setState(() => _currentImage = index);
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(_images[index], fit: BoxFit.cover),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.swipe,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Swipe",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 70,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(
                          Icons.ios_share_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.black45,
                        child: Icon(Icons.percent, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '34m²',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Lenas\nDonau Hotel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '72k Reviews',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TYROLEAN ALPS',
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          InfoChip(
                            icon: Icons.location_on,
                            label: '1km to centre',
                          ),
                          InfoChip(icon: Icons.people, label: '2'),
                          InfoChip(
                            icon: Icons.calendar_today,
                            label: '10 days',
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          FeatureTile(icon: Icons.bed, label: '1 king bed'),
                          FeatureTile(icon: Icons.wifi, label: 'Free wi-fi'),
                          FeatureTile(icon: Icons.tv, label: 'TV'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'From \$80/night',
                            style: TextStyle(fontSize: 18),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFCEE741),
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
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 330,
              right: 30,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: Icon(Icons.star_border, color: Colors.white),
              ),
            ),
            Positioned(
              bottom: 360,
              left: MediaQuery.of(context).size.width / 2 - 15,
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
                              ? Colors.white
                              : Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      avatar: Icon(icon, color: Colors.black54, size: 20),
      label: Text(label, style: TextStyle(color: Colors.black87)),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const FeatureTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.black),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
