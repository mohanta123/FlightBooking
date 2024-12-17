import 'package:flutter/material.dart';

import '../Bookings/bookings.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // Text controllers to manage the input
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  // Swap function
  void _swapLocations() {
    setState(() {
      final temp = _fromController.text;
      _fromController.text = _toController.text;
      _toController.text = temp;
    });
  }

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
            Stack(
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/yy.png'),
                  ),
                ),
                Positioned(
                  left: 10,
                  child: Text(
                    "Let's start your trip",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            /// Flight Option Tabs
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
                    _flightOptionButton("Round Trip", 0, _selectedIndex),
                    _flightOptionButton("One Way", 1, _selectedIndex),
                    _flightOptionButton("Multi-City", 2, _selectedIndex),
                  ],
                ),
              ),
            ),

            /// Flight Search Form
            _buildSearchFlight(),
            _buildSearchForm(),

            /// Search Button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {

                  _onSearchPressed();
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
            /// Flight and Hotel Packages
            _sectionHeader("Flight & Hotel Packages", ""),
            _buildPromotionalBanner(),
          ],
        ),
      ),
    );
  }

  DateTime? selectedDate;
  DateTime? departureDate;
  DateTime? returnDate;

  int _selectedIndex = 1;

  void _onOptionSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Flight Options Toggle Buttons
  Widget _flightOptionButton(String label, int index, int selectedIndex) {
    return GestureDetector(
      onTap: () => _onOptionSelected(index), // Handle selection
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Colors.green.shade800
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  /// Search Form Widgets
  Widget _buildSearchForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _formFieldWithCalendar(
                    Icons.date_range, "Select Departure",
                    isDeparture: true),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _formFieldWithCalendar(Icons.date_range, "Select Return",
                    isDeparture: false),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.people, color: Colors.green.shade800),
                      hintText: "Travelers",
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.green.shade800,
                          width: 1, // Set the border width
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green.shade800, width: 1),
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: InputBorder.none, // Removes the underline
                    ),
                    items: <String>['Economy', 'Premium Economy', 'Business', 'First Class']
                        .map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
                        .toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change
                    },
                    hint: Text("Cabin Class"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchFlight() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // From Field
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _fromController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.flight_takeoff,
                          color: Colors.green.shade800),
                      hintText: "From",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // To Field
                SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _toController,
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.flight_land, color: Colors.green.shade800),
                      hintText: "To",
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Swap Button
          Positioned(
            top: 30,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.swap_vert, color: Colors.green.shade800),
                onPressed: _swapLocations,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Header
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

  /// Travel Inspirations Section
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

  /// Promotional Banner
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

  Widget _formFieldWithCalendar(IconData icon, String hintText,
      {required bool isDeparture}) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          setState(() {
            if (isDeparture) {
              departureDate = pickedDate;
            } else {
              returnDate = pickedDate;
            }
          });
        }
      },
      child: Container(
        height: 50,
        child: AbsorbPointer(
          child: TextField(
            controller:
                _controller,
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.green.shade800),
              hintText: isDeparture
                  ? (departureDate != null
                      ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                      : hintText)
                  : (returnDate != null
                      ? "${returnDate!.day}/${returnDate!.month}/${returnDate!.year}"
                      : hintText),
              filled: true,
              fillColor: Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green.shade800,
                  width: 1,
                ),
              ),
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: isDeparture
                    ? departureDate ?? DateTime.now()
                    : returnDate ?? DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                setState(() {
                  if (isDeparture) {
                    departureDate = pickedDate;
                  } else {
                    returnDate = pickedDate;
                  }
                  _controller.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                });
              }
            },
          ),
        ),
      ),
    );
  }

  void _onSearchPressed() {
    if (_fromController.text.isEmpty || _toController.text.isEmpty || departureDate == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in both "From" and "To" and "Departure" fields.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => Bookings()));
  }


  final TextEditingController _controller = TextEditingController();
}
