import 'dart:convert';
import 'package:bike_project/screens/profile.dart';
import 'package:bike_project/screens/support.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:math';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  left: -deviceWidth * 0.12,
                  top: -deviceHeight * 0,
                  child: Image.asset(
                    'assets/images/Group.png',
                    width: deviceWidth * 0.8,
                    height: deviceHeight * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 70.0, bottom: 145, left: 80.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: deviceWidth * 0.06, // Responsive text size
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.8, 1.05),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: deviceWidth * 0.06, // Responsive icon size
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
            ..._buildListTiles(context, deviceWidth),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyHome()),
                    );
                  },
                  child: SizedBox(
                    width: deviceWidth * 0.1,
                    height: deviceWidth * 0.1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/images/home.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
      body: const MyHomePage(),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Column(
            children: [
              Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.11,
                          left: MediaQuery.of(context).size.width * 0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset(
                            'assets/images/menu.png',
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

              Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.01,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/notification.png',
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

              Padding(
                padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.015,
              ),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0), // Add top padding
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _buildDialogOption(
                                      'assets/images/horn.png',
                                      'Horn',
                                      () {
                                        // Code to handle horn functionality
                                      },
                                      deviceWidth,
                                    ),
                                    _buildDialogOption(
                                      'assets/images/light.png',
                                      'Turn on Light',
                                      () {
                                        // Code to handle light functionality
                                      },
                                      deviceWidth,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: deviceWidth * 0.5, // Specify the desired width
                                      child: gradientButton(
                                          context, "Navigate", null, () {
                                        // Code to handle navigation
                                      }),
                                    ),
                                    const SizedBox(height: 10),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Image.asset(
                    'assets/images/bikefuction.png',
                    width: deviceWidth * 0.12,
                    height: deviceWidth * 0.12,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.41,
                    left: MediaQuery.of(context).size.width * 0.01,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/bluetooth.png',
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.width * 0.12,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.015,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/location.png',
                            width: MediaQuery.of(context).size.width * 0.12,
                            height: MediaQuery.of(context).size.width * 0.12,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )

            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }

  List<Widget> _buildListTiles(BuildContext context, double deviceWidth) {
    final List<Map<String, dynamic>> items = [
      {'image': 'assets/images/profile.png', 'title': 'Profile', 'page': const ProfilePage()},
      {'image': 'assets/images/service.png', 'title': 'Service', 'page': const ProfilePage()},
      {'image': 'assets/images/bikedetails.png', 'title': 'Bike Details', 'page': const ProfilePage()},
      {'image': 'assets/images/ridehistory.png', 'title': 'Ride History', 'page': const ProfilePage()},
      {'image': 'assets/images/manuals.png', 'title': 'Manuals', 'page': const ProfilePage()},
      {'image': 'assets/images/support.png', 'title': 'Support', 'page': const SupportPage()},
    ];

    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 16.0),
        child: ListTile(
          leading: SizedBox(
            width: deviceWidth * 0.09, // Responsive size
            height: deviceWidth * 0.09, // Responsive size
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                item['image'],
                width: deviceWidth * 0.09,
                height: deviceWidth * 0.09,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(item['title'], style: TextStyle(fontSize: deviceWidth * 0.05)), // Responsive text size
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => item['page'],
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      );
    }).toList();
  }

  Widget _buildDialogOption(String imagePath, String label, VoidCallback onPressed, double deviceWidth) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 254, 254),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(imagePath),
              width: deviceWidth * 0.07, // Adjust the size of the image as needed
              height: deviceWidth * 0.07, // Adjust the size of the image as needed
            ),
            SizedBox(height: deviceWidth * 0.02), // Add spacing between image and text
            Text(
              label,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

Widget gradientButton(BuildContext context, String text, IconData? icon, VoidCallback onPressed) {
  double deviceWidth = MediaQuery.of(context).size.width;

  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
    ),
    onPressed: onPressed,
    child: Ink(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF202832),
            Color(0xFF105B9C),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: deviceWidth * 0.5, // Responsive max width
          minHeight: deviceWidth * 0.1, // Responsive min height
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: deviceWidth * 0.04, // Responsive text size
          ),
        ),
      ),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: deviceWidth * 0.44),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/image_bike.png',
                    width: deviceWidth * 0.95,
                    height: deviceHeight * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.7,
              left: 0,
              right: deviceWidth * 0.02,
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -90 * (3.1415926535897932 / 180),
                  child: Text(
                    'Origin',
                    style: TextStyle(
                      fontFamily: 'Prompt',
                      fontSize: deviceWidth * 0.2,
                      letterSpacing: 0,
                      color: Color(0x532D2A2A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: deviceHeight * 0.048,
              left: deviceWidth * 0.25,
              child: Align(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/briskhome.png',
                    width: deviceWidth * 0.45,
                    height: deviceHeight * 0.022,
                  ),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/Mainside.png',
                  width: deviceWidth * 0.4,
                  height: deviceHeight,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.05, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: deviceWidth * 0.085, bottom: deviceHeight * 0.04),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Ellipsehom.png',
                    width: deviceWidth * 0.24,
                    height: deviceWidth * 0.24,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: AnimatedCircularWave(
                batteryPercentage: 79,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedCircularWave extends StatefulWidget {
  final int batteryPercentage;

  const AnimatedCircularWave({Key? key, required this.batteryPercentage}) : super(key: key);

  @override
  _AnimatedCircularWaveState createState() => _AnimatedCircularWaveState();
}

class _AnimatedCircularWaveState extends State<AnimatedCircularWave> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth * 0.4,
      height: deviceWidth * 0.4, // Make it a square
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: CircularWavePainter(_animation.value),
                child: const SizedBox.expand(),
              );
            },
          ),
          CircularLightAnimation(
            batteryPercentage: widget.batteryPercentage,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class VehicleDashboardScreen extends StatefulWidget {
  const VehicleDashboardScreen({super.key});

  @override
  _VehicleDashboardScreenState createState() => _VehicleDashboardScreenState();
}

class _VehicleDashboardScreenState extends State<VehicleDashboardScreen> {
  Map<String, dynamic> vehicleData = {}; // Provide a default initialization
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchVehicleDashboard();
  }

  Future<void> fetchVehicleDashboard() async {
    const url = 'http://34.93.202.185:5000/api/v1/get_vehicle_dashboard?vehicle_id=brk123456789&session=brk129';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          vehicleData = data['data']; // Assuming 'data' is the key for the vehicle data
          isLoading = false;
        });
        print('Vehicle data: $vehicleData');
        // Debugging: Print the API response
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load vehicle dashboard: ${response.statusCode}';
        });
        print(errorMessage);
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Failed to load vehicle dashboard: $e';
      });
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : vehicleData.isEmpty
                  ? const Center(child: Text('No data available'))
                  : Center(
                      child: CircularLightAnimation(
                        batteryPercentage: vehicleData['battery'] ?? 0,
                      ),
                    ),
    );
  }
}

class CircularWavePainter extends CustomPainter {
  final double animationValue;

  CircularWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2.1, size.height / 2.50);
    final maxRadius = size.width / 2.2;
    final paint = Paint()
      ..color = Color.fromARGB(255, 255, 255, 255).withOpacity(0.2);

    const circlesCount = 8;
    for (int i = 0; i < circlesCount; i++) {
      final radius = maxRadius * animationValue * (1 - i / circlesCount);
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircularLightAnimation extends StatefulWidget {
  final int batteryPercentage;

  const CircularLightAnimation({Key? key, required this.batteryPercentage}) : super(key: key);

  @override
  _CircularLightAnimationState createState() => _CircularLightAnimationState();
}

class _CircularLightAnimationState extends State<CircularLightAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return CustomPaint(
      size: Size.square(deviceWidth * 0.24),
      painter: CircularLightPainter(
        animation: _controller,
        batteryPercentage: widget.batteryPercentage,
      ),
    );
  }
}

class CircularLightPainter extends CustomPainter {
  final Animation<double> animation;
  final int batteryPercentage;

  CircularLightPainter({
    required this.animation,
    required this.batteryPercentage,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..shader = SweepGradient(
        colors: [
          const Color.fromARGB(0, 0, 38, 255),
          const Color.fromARGB(255, 44, 52, 195).withOpacity(0.5),
          const Color.fromARGB(255, 0, 4, 255),
          const Color.fromARGB(255, 118, 120, 121).withOpacity(0.5),
          Colors.transparent,
        ],
        stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
        startAngle: 0.0,
        endAngle: 2 * pi,
        transform: GradientRotation(animation.value * 2 * pi),
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Offset center = Offset(size.width / 2.22, size.height / 3.2);
    final double radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);

    // Draw the battery percentage text in the center
    final textPainter = TextPainter(
      text: TextSpan(
        text: '$batteryPercentage%',
        style: TextStyle(
          fontSize: size.width * 0.15, // Responsive font size
          color: const Color.fromARGB(255, 0, 0, 0),
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    final textOffset = Offset(
      center.dx - textPainter.width / 2,
      center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CircularLightPainter oldDelegate) {
    return true;
  }
}
