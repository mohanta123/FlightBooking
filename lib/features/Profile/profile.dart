import 'package:flutter/material.dart';

import '../../core/Contants/fontStyle.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: Text(
          "Profile",
          style: TextFont.bold_TextStyle.copyWith(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: deviceHeight * 0.02),
            SizedBox(
              width: deviceWidth * 25,
              height: deviceHeight * 0.15,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Card color
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset: Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.indigo,
                      width: 0.2,
                    ),
                  ),
                  child: Card(
                    color: Colors.transparent, // To keep the color consistent
                    elevation:
                        0, // Remove default card elevation since we're using a custom shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/client.png'),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rakesh Das',
                                    style: TextFont.bold_TextStyle.copyWith(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    '+1 234 567 8901', // Replace with the actual phone number
                                    style: TextFont.normal_TextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            SizedBox(height: deviceHeight * 0.02),
            SizedBox(
              width: deviceWidth * 25,
              height: deviceHeight * 0.12,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Card color
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.indigo,
                    width: 0.2,
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.all(0), // Remove card margin
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Reduced padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        //  Spacer(), // Adds flexible space
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.green),
                              onPressed: () {
                                // Handle call action
                              },
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(
                                Icons.message,
                                size: 20,
                                color: Colors.green,
                              ), // Adjusted icon size
                              onPressed: () {
                                // Handle message action
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: deviceHeight * 0.02),
            SizedBox(
              width: deviceWidth * 25,
              height: deviceHeight * 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Card color
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.indigo,
                    width: 0.2,
                  ),
                ),
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin: EdgeInsets.all(0), // Remove card margin
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Reduced padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.privacy_tip,
                                  size: 20, color: Colors.green),
                              onPressed: () {
                                // Handle call action
                              },
                            ),
                            Text("Privacy Policy",
                                style: TextFont.normal_TextStyle.copyWith(
                                    fontSize: 15, color: Colors.green)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.privacy_tip,
                                  size: 20, color: Colors.green),
                              onPressed: () {},
                            ),
                            Text("Terms and Conditions",
                                style: TextFont.normal_TextStyle.copyWith(
                                    fontSize: 15, color: Colors.green)),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => SignInPage()),
                            // );
                          },
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.power_settings_new,
                                    size: 20, color: Colors.green),
                                onPressed: () {},
                              ),
                              Text(
                                "Logout",
                                style: TextFont.normal_TextStyle.copyWith(
                                    fontSize: 15, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
