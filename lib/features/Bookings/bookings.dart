import 'package:flutter/material.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  // Sample flight slots data
  final List<String> timeSlots = [
    "Mar 22 - Mar 23",
    "Mar 23 - Mar 24",
    "Mar 24 - Mar 25",
    "Mar 25 - Mar 26",
  ];

  // Sample flight data
  final List<Map<String, dynamic>> flights = [
    {
      'onwardTime': '14:35',
      'onwardDuration': '4h 30m',
      'onwardArrival': '21:55',
      'onwardRoute': 'BLR - Dubai',
      'returnTime': '21:55',
      'returnDuration': '4h 30m',
      'returnArrival': '14:35',
      'returnRoute': 'DXB - Bengaluru',
      'price': 'AED 409'
    },
    {
      'onwardTime': '14:35',
      'onwardDuration': '4h 30m',
      'onwardArrival': '21:55',
      'onwardRoute': 'BLR - Dubai',
      'returnTime': '21:55',
      'returnDuration': '4h 30m',
      'returnArrival': '14:35',
      'returnRoute': 'DXB - Bengaluru',
      'price': 'AED 399'
    },
  ];

  int selectedSlot = 0; // Index of the selected time slot

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Ezy Travel"),
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(
        children: [
          // Search Bar and Filter Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "BLR - Bengaluru to DXB - Dubai",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  "Departure: Sat, 23 Mar | Return: Sat, 23 Mar\nRound Trip | Ready, Steady",
                  style:
                  TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _customButton("Sort", Icons.sort),
                    _customButton("Non - Stop", Icons.flight_takeoff),
                    _customButton("Filter", Icons.filter_alt),
                  ],
                ),
                const SizedBox(height: 10),
                // Time Slots Row
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedSlot = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedSlot == index
                                ? Colors.green.shade400
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              timeSlots[index],
                              style: TextStyle(
                                  color: selectedSlot == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          // Flight Listings
          Expanded(
            child: ListView.builder(
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                return _flightCard(flight);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to create custom buttons
  Widget _customButton(String text, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16, color: Colors.green),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  // Function to build flight card
  Widget _flightCard(Map<String, dynamic> flight) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _flightInfoRow("Onward - Garuda Indonesia", flight['onwardTime'],
              flight['onwardDuration'], flight['onwardArrival'], flight['onwardRoute']),
          Divider(color: Colors.grey.shade300),
          _flightInfoRow("Return - Garuda Indonesia", flight['returnTime'],
              flight['returnDuration'], flight['returnArrival'], flight['returnRoute']),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                flight['price'],
                style: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Flight Details >",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to display flight info row
  Widget _flightInfoRow(String title, String time, String duration,
      String arrival, String route) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Column(
              children: [
                Text(

                  duration,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 1,
                  width: 60,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
            Text(
              arrival,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          route,
          style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
        ),
      ],
    );
  }
}
