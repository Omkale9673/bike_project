import 'package:bike_project/screens/bike_detail.dart';
import 'package:bike_project/screens/locate_bike.dart';
import 'package:bike_project/screens/notification.dart';
import 'package:bike_project/screens/profile.dart';
import 'package:bike_project/screens/services.dart';
import 'package:bike_project/screens/support.dart';
import 'package:bike_project/screens/tire_health.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Stack(
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, right: 80.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0), // Adjust the padding as needed
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            const Text(
                              'Menu',
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
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 110.0, bottom: 115, left: 80.0),
                  ),
                ),
              ],
            ),
            ..._buildListTiles(context),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
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
                    width: MediaQuery.of(context).size.width * 0.14,
                    height: MediaQuery.of(context).size.width * 0.14,
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
      body: const SafeArea(child: HomePageContent()),
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
                  onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationPage()),
                  );},
                  child: Image.asset(
                    'assets/images/notification.png',
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
                  onTap: () {
                    showDialog(
  context: context,
  builder: (BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dialogBackgroundColor: Colors.white, 
      ),
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDialogOption(
                    'assets/images/horn.png',
                    'Hork',
                    () {
                    },
                    MediaQuery.of(context).size.width,
                  ),
                  _buildDialogOption(
                    'assets/images/light.png',
                    'Turn ON lights',
                    () {
                    },
                    MediaQuery.of(context).size.width,
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
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 9, 84, 94),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Color.fromARGB(255, 9, 84, 94),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);

                  },
                  child: Image.asset(
                    'assets/images/bikefuction.png',
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.width * 0.12,
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

  List<Widget> _buildListTiles(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/profile.png',
        'title': 'Profile',
        'page': const ProfilePage()
      },
      {
        'image': 'assets/images/service.png',
        'title': 'Services',
        'page': const ServicePage()
      },
      {
        'image': 'assets/images/tirehealth.png',
        'title': 'Tire Health',
        'page': const TireHealthPage()
      },
      {
        'image': 'assets/images/trackmybike.png',
        'title': 'Track MyBike',
        'page': const LocateBikePage()
      },
      {
        'image': 'assets/images/bikedetails.png',
        'title': 'Bike Details',
        'page': const BikeDetailsPage()
      },
      {
        'image': 'assets/images/support.png',
        'title': 'Support',
        'page': const SupportPage()
      },
    ];

    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.only(top: 2.0, left: 16.0),
        child: ListTile(
          leading: SizedBox(
            width: MediaQuery.of(context).size.width * 0.09, // Responsive size
            height: MediaQuery.of(context).size.width * 0.09, // Responsive size
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                item['image'],
                width: MediaQuery.of(context).size.width * 0.09,
                height: MediaQuery.of(context).size.width * 0.09,
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(item['title'],
              style: const TextStyle( 
                  fontFamily: 'Raleway', 
                                    fontWeight: FontWeight.w600, 
                  fontSize: 19 )), // Responsive text size
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    item['page'],
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
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

  Widget _buildDialogOption(String imagePath, String label,
      VoidCallback onPressed, double deviceWidth) {
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
              width:
                  deviceWidth * 0.07, // Adjust the size of the image as needed
              height:
                  deviceWidth * 0.07, // Adjust the size of the image as needed
            ),
            SizedBox(
                height:
                    deviceWidth * 0.02), // Add spacing between image and text
            Text(
              label,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: GradientBox(),
        ),
        Positioned(
              top: MediaQuery.of(context).size.height * 0.7, // Adjust as needed
              left: 0,
              right: -20,
              child: Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -90 * (3.1415926535897932 / 180),
                  child: const Text(
                    'Origin',
                    style: TextStyle(
                      fontFamily: 'ethnocentric',
                      fontSize: 54,
                      letterSpacing: 0,
                      color: Color(0x532D2A2A),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(185, 0, 0, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/image_bike.png',
                width: 420,
                height: MediaQuery.of(context).size.height,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 40,
          right: 0,
          child: Align(
            child: ClipRRect(
              child: Image.asset(
                'assets/images/briskhome.png',
                width: 160,
                height: 18,
              ),
            ),
          ),
        ),
        const Center(
          child: TripleLayerSquare(),
        ),
      ],
    );
  }
}

class GradientBox extends StatelessWidget {
  const GradientBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 100,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(9, 84, 94, 0.517708),
              Color(0xFF0C7785),
              Color(0xFF09545E),
            ],
            transform: GradientRotation(90.3 * (3.1415927 / 90)),
            stops: [0.0, 0.7103, 1.1206],
          ),
        ),
      ),
    );
  }
}

class TripleLayerSquare extends StatelessWidget {
  const TripleLayerSquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double size = constraints.maxWidth * 0.5;

        return Align(
          alignment: Alignment.centerLeft,
          child: Transform.rotate(
            angle: 45 * (3.1415927 / 180),
            child: Container(
              width: size * 0.83,
              height: size * 0.83,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  transform: GradientRotation(86.62 * (3.1415927 / 90)),
                  stops: [0.2505, 0.7943, 1.2565, 1.658],
                  colors: [
                    Color(0xFF09545E),
                    Color(0xFF0C7785),
                    Color.fromRGBO(9, 84, 94, 0.517708),
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(size * 0.175),
              ),
              child: Center(
                child: Transform.rotate(
                  angle: -90 * (3.1415927 / 180),
                  child: Container(
                    width: size * 0.7,
                    height: size * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size * 0.125),
                    ),
                    child: Center(
                      child: Transform.rotate(
                        angle: 90 * (3.1415927 / 90),
                        child: Container(
                          width: size * 0.6,
                          height: size * 0.6,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              transform:
                                  GradientRotation(90.3 * (3.1415927 / 90)),
                              stops: [0.1376, 0.5174, 0.8403, 1.1206],
                              colors: [
                                Color(0xFF09545E),
                                Color(0xFF0C7785),
                                Color.fromRGBO(9, 84, 94, 0.517708),
                                Colors.transparent,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(size * 0.125),
                          ),
                        ),
                      ),
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