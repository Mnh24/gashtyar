import 'package:flutter/material.dart';

import 'HotelDetailsPage.dart';
import 'bottomNavBar.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final destinations = [
      ["Shangri-La's", "", "assets/images/hotel/hotelParadise.jpeg"],
      [
        "SWITZERLAND",
        "Emerald Pass",
        "assets/images/Countries/switzerland.jpg",
      ],
      ["CANADA", "Summit Serenity", "assets/images/Countries/canada.jpeg"],
      ["NEW ZEALAND", "", "assets/images/Countries/nz.jpeg"],
      ["AUSTRIA", "", "assets/images/Countries/austria.jpeg"],
      ["Turkey", "Istanbul", "assets/images/Countries/Istanbul.jpeg"],
      ["Turkey", "Bosphorus", "assets/images/Countries/IstanbulBosphorus.jpeg"],
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 242, 226),
      body: SafeArea(
        child: Stack(
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
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.tune, color: Colors.black, size: 30),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "Hiking",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.hiking, size: 16, color: Colors.black),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "Hotels",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.hotel, size: 16, color: Colors.black),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "Kayaking",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.sailing,
                                size: 16,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: const [
                              Text(
                                "Biking",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.directions_bike,
                                size: 16,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      itemCount: destinations.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                builder:
                                    (context) => HotelDetailsPage(
                                      // country: destinations[index][0],
                                      // title: destinations[index][1],
                                      // imagePath: destinations[index][2],
                                    ),
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
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,
              child: BottomNavBar(currentIndex: 1),
            ),
          ],
        ),
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
