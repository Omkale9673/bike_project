
import 'dart:io';

import 'package:bike_project/screens/home.dart';
import 'package:bike_project/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bike_project/screens/otp.dart';
import 'package:bike_project/screens/phone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyD0sPQwYjN7cAh8QlMoNmkPLESupfXXgG8",
      appId: "1:216528158205:android:222ecb5ab66986f403ad94",
      messagingSenderId: "216528158205",
      projectId: "bike-db1c2",
    ),
  )

  :await Firebase.initializeApp();
  runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'splashscreen':(context) => AnimatedSVGDemo(),
      'phone':(context) => const MyPhone(),
      'otp':(context) => const Myotp(),
      'home':(context) => MyHome(),

    },
  ));
}

