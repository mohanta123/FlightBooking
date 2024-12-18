import 'package:flutter/material.dart';
import '../../core/Contants/fontStyle.dart';
import '../Home/loginScreen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isAuthenticated = true; // Authentication state
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
                    color: Colors.transparent,
                    elevation: 0,
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
                                backgroundImage: AssetImage('assets/dubai1.jpg'),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Padmalochana Mohanta',
                                    style: TextFont.bold_TextStyle.copyWith(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Text(
                                    '+91 1234567890',
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
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.call, size: 20, color: Colors.green),
                              onPressed: () {
                                // Handle call action
                              },
                            ),
                            SizedBox(width: 16),
                            IconButton(
                              icon: Icon(Icons.message, size: 20, color: Colors.green),
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
                  margin: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.privacy_tip, size: 20, color: Colors.green),
                              onPressed: () {
                                // Handle privacy policy action
                              },
                            ),
                            Text("Privacy Policy",
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.privacy_tip, size: 20, color: Colors.green),
                              onPressed: () {
                                // Handle terms and conditions action
                              },
                            ),
                            Text("Terms and Conditions",
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.green,
                                )),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isAuthenticated = false; // Set authentication state to false
                            });

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (BuildContext context) => LoginScreen(),
                              ),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.power_settings_new, size: 20, color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    _isAuthenticated = false; // Set authentication state to false
                                  });

                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => LoginScreen(),
                                    ),
                                        (Route<dynamic> route) => false,
                                  );
                                },
                              ),
                              Text(
                                "Logout",
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: 15,
                                  color: Colors.green,
                                ),
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
