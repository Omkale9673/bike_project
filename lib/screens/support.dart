
import 'package:bike_project/screens/home.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: scaffoldKey,
      body: Stack(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Goldman',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          
          
          
          Align(
            alignment: const AlignmentDirectional(-0.8, -0.85),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.04, 0.94),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHome()),
                );
              },
              child: Image.asset(
                'assets/images/home.png',
                width: 32.0, // Match container size
                height: 32.0, // Match container size
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.50),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: MediaQuery.of(context).size.width > 600
                  ? const Text(
                      'Hello, How can we help you?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 34,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : const Text(
                      'Hello, How can we help you ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.25),
            child: Container(
              margin: const EdgeInsets.fromLTRB(25, 35, 25, 25),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                autofocus: true,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'About',
                  labelStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0,
                  ),
                  hintStyle: const TextStyle(
                    fontFamily: 'Montserrat',
                    letterSpacing: 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 3, 3, 3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 3, 3, 3),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.25),
            child: SizedBox(
              width: 317, // Adjust the width as needed
              height: 55, // Adjust the height as needed
              child: TextButton(
                onPressed: () {
                  // Add your submit logic here
                },
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.zero, // Remove padding around the button text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(73), // Rounded corners
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2A76D0), // Start color
                        Color(0xFF8A5EEA), // End color
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(1000), // Rounded corners
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Submit Issue',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white, // Text color of the button
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0, 0.44),
            child: Divider(
              height: 0,
              thickness: 2,
              indent: 20,
              color: Colors.black,
              endIndent: 250,
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0, 0.44),
            child: Divider(
              height: 0,
              thickness: 2,
              indent: 250,
              color: Colors.black,
              endIndent: 20,
            ),
          ),
          const Align(
            alignment: AlignmentDirectional(0, 0.44),
            child: Text(
              'OR',
              style: TextStyle(
                fontFamily: 'poppins',
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0.70),
            child: SizedBox(
              width: 317, // Adjust the width as needed
              height: 55, // Adjust the height as needed
              child: TextButton(
                onPressed: () {
                  // Add your submit logic here
                },
                style: TextButton.styleFrom(
                  padding:
                      EdgeInsets.zero, // Remove padding around the button text
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(73), // Rounded corners
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF2A76D0), // Start color
                        Color(0xFF8A5EEA), // End color
                      ],
                    ),
                    borderRadius: BorderRadius.circular(
                        1000), // Extremely rounded corners
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12), // Padding for icon and text spacing
                    child: const Row(
                      mainAxisSize: MainAxisSize
                          .min, // Use the minimum space that content needs
                      children: [
                        Icon(Icons.phone, color: Colors.white), // Phone icon
                        SizedBox(width: 8), // Space between icon and text
                        Text(
                          'Customer Care',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white, // Text color of the button
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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