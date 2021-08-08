import 'package:animated_onboarding/screens/onboard/onboard.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboard(),
      theme: ThemeData(primaryColor: const Color(0xFF4A00E0)),
    );
  }
}
