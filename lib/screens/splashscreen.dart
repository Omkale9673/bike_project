import 'package:bike_project/screens/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedSVGDemo extends StatefulWidget {
  @override
  _AnimatedSVGDemoState createState() => _AnimatedSVGDemoState();
}

class _AnimatedSVGDemoState extends State<AnimatedSVGDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(); // Continuously repeat the animation

    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {
          // Trigger a rebuild whenever the animation value changes
        });
      });

    // Add a delay before navigating to the login page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyPhone()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Properly dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white.withOpacity(0),
                Colors.white,
                Colors.white.withOpacity(0)
              ],
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3
              ],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 28, // Adjust to your SVG's dimensions
            height: 28,
            color: const Color.fromARGB(255, 0, 0, 0),
            colorBlendMode: BlendMode.srcIn, // Apply the color to the SVG
          ), // Use srcATop to blend the shader and the image properly
        ),
      ),
    );
  }
}