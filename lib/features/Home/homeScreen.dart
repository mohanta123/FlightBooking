import 'package:flutter/material.dart';

import '../Bookings/bookings.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green.shade800,
        title: const Text(
          "Search Flights",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Green Section
            Container(
              color: Colors.green.shade800,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Let's start your trip",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Image.asset(
                    'assets/download.jpg', // Replace with your image asset path
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
            // Flight Option Tabs
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _flightOptionButton("Round Trip", true),
                    _flightOptionButton("One Way", false),
                    _flightOptionButton("Multi-City", false),
                  ],
                ),
              ),
            ),
            // Flight Search Form
            _buildSearchForm(),
            // Search Button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Bookings()));
                },
                child: const Text(
                  "Search Flights",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            // Travel Inspirations
            _sectionHeader("Travel Inspirations", "Dubai"),
            _travelInspirationSection(),
            // Flight and Hotel Packages
            _sectionHeader("Flight & Hotel Packages", ""),
            _buildPromotionalBanner(),
          ],
        ),
      ),
    );
  }

  // Flight Options Toggle Buttons
  Widget _flightOptionButton(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade800 : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Search Form Widgets
  Widget _buildSearchForm() {
    return Column(
      children: [
        _formField(Icons.flight_takeoff, "From"),
        _formField(Icons.flight_land, "To"),
        Row(
          children: [
            Expanded(
              child: _formField(Icons.date_range, "Sat, 23 Mar - 2024"),
            ),
            Expanded(
              child: _formField(Icons.people, "1 Passenger"),
            ),
          ],
        ),
        _formField(Icons.airline_seat_recline_normal, "Economy Class"),
      ],
    );
  }

  Widget _formField(IconData icon, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: SizedBox(
        height: 40,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.green.shade800),
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  // Section Header
  Widget _sectionHeader(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: TextStyle(color: Colors.green.shade800),
            ),
        ],
      ),
    );
  }

  // Travel Inspirations Section
  Widget _travelInspirationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          _travelInspirationCard("Saudi Arabia", "assets/dubai1.jpg"),
          const SizedBox(width: 12),
          _travelInspirationCard("Kuwait", "assets/dubai2.jpg"),
        ],
      ),
    );
  }

  Widget _travelInspirationCard(String title, String imagePath) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Promotional Banner
  Widget _buildPromotionalBanner() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage('assets/download.jpg'), // Replace with your image
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Build your vacation at the best price!",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
