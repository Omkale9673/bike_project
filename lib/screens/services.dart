
import 'package:flutter/material.dart';

class ServiceModel {
  void dispose() {}
}

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                          'Services',
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
