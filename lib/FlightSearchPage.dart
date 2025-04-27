import 'package:flutter/material.dart';
import 'BottomNavBar.dart'; // Import your bottom nav

class FlightSearchPage extends StatefulWidget {
  const FlightSearchPage({super.key});

  @override
  State<FlightSearchPage> createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _containerColorAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _containerSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _backgroundColorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 255, 255, 255),
      end: const Color.fromARGB(255, 232, 242, 226),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _containerColorAnimation = ColorTween(
      begin: const Color(0xFF1D2B1F),
      end: Colors.white,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
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
            backgroundColor: _backgroundColorAnimation.value,
            body: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    color: _containerColorAnimation.value,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(300),
                      bottomLeft: Radius.circular(350),
                    ),
                  ),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Positioned.fill(
                          // Makes content take all screen
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: _buildContent(),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 20,
                          right: 20,
                          child: BottomNavBar(currentIndex: 3),
                        ),
                      ],
                    ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            const Spacer(),
            ToggleButtons(
              isSelected: [true, false],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              selectedColor: Colors.white,
              fillColor: const Color(0xFF1E2E1B),
              color: Colors.black,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2E1B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Text("One way", style: TextStyle(color: Colors.white)),
                        // SizedBox(width: 10),
                        // Icon(
                        //   Icons.calendar_month_outlined,
                        //   size: 16,
                        //   color: Colors.black,
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
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
                          "Round trip",
                          style: TextStyle(color: Colors.black),
                        ),
                        // SizedBox(width: 10),
                        // Icon(
                        //   Icons.calendar_month_outlined,
                        //   size: 16,
                        //   color: Colors.black,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
              onPressed: null,
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 230, 230, 230),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("Chicago", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.flight_takeoff, size: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "SZG",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text("Salzburg", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2E1B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "Searching",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.search, size: 16, color: Colors.white),
                      ],
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.sync_alt, size: 16),
                    label: const Text("Change"),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text("Today", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10),
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
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
                      "February, 2025",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.calendar_month_outlined,
                      size: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 15),
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
                    Text("8/10", style: TextStyle(color: Colors.black)),
                    SizedBox(width: 10),
                    Icon(Icons.person_outline, size: 16, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _buildDaysRow(),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "14 Tickets found",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(Icons.filter_list, size: 20, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildTicketCard(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDaysRow() {
    final List<String> days = ["S", "M", "T", "W", "T"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            days.map((item) {
              return Container(
                margin: const EdgeInsets.all(20),
                width: 50,
                height: 70,
                decoration: BoxDecoration(
                  color:
                      item == "M"
                          ? const Color(0xFFCEE741)
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: item == "M" ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            item == "M"
                                ? const Color(0xFFCEE741)
                                : Colors.grey.shade200,
                        boxShadow:
                            item == "M"
                                ? [
                                  const BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                  ),
                                ]
                                : [],
                      ),
                      child: Center(
                        child: Text(
                          (13 + days.indexOf(item)).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: item == "M" ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildTicketCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFDDE478),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: const [
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    "AIRLINES",
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.flight_takeoff, size: 35),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("USA", style: TextStyle(fontWeight: FontWeight.bold)),
                    Icon(Icons.flight, color: Colors.grey),
                    Text("SZG", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("4:30pm\nSun, 2 Feb"),
                    Text("2:30am\nMon, 2 Feb"),
                  ],
                ),
                Divider(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Seats\n18B, 19A"),
                    Text("Terminal\nY4"),
                    Text("Gate\n8"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
