import 'dart:io';

import 'package:bike_project/screens/editprofile.dart';
import 'package:bike_project/screens/home.dart';
import 'package:flutter/material.dart';

class ProfileModel {
  void dispose() {}
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileModel _model;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = ProfileModel();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 70,
                left: 0,
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: 301,
                    height: 114.43,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.1376, 0.5174, 0.8403, 1.1206],
                        colors: [
                          Color(0xFF09545E),
                          Color(0xFF0C7785),
                          Color(0x8309545E),
                          Color(0x00054C66),
                        ],
                        transform: GradientRotation(90.3 * (3.1415927 / 90)),
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.elliptical(0, 100),
                      ),
                    ),
                    child: Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    // Padding for IconButton
    Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0), // Adjust the padding as needed
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 24,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ),
    const Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0), // Adjust the padding as needed
      child: Text(
        'Profile',
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Goldman',
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)

                  ),
                ),
              ),
                Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                child: GestureDetector(
                  onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfilePage()),
                  );
              },
                  child: Container(
                    height: 27,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mange Document',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 32, 32, 32),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.77, 0.25),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/logout.png',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                    width:
                                        8), // Adjust spacing between image and text as needed
                                const Flexible(
                                  child: Text(
                                    'Are you sure you want to logout?',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Raleway',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100, // Adjust width as needed
                                  height: 40, // Adjust height as needed
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.green, // Border color
                                      width: 2.0, // Border width
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () => exit(0),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .transparent, // Set transparent color for ElevatedButton
                                      elevation: 0, // Remove elevation
                                    ),
                                    child: const Text(
                                      'Ok',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Raleway',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context).textTheme.bodyLarge!.merge(
                          const TextStyle(
                            fontFamily: 'Raleway',
                            color: Color(0xFFFF693B),
                            fontSize: 19,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.04, 0.94),
                child: GestureDetector(
                  onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHome()),
                  );},
                  child: Image.asset(
                    'assets/images/home.png',
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0); // Top left
    path.lineTo(size.width, 0); // Top right
    path.lineTo(size.width, size.height - 40); // Bottom right cut
    path.lineTo(size.width - 85, size.height); // Bottom right corner
    path.lineTo(0, size.height); // Bottom left
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
