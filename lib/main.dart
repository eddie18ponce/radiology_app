import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(RadiologyApp());
}

class RadiologyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Radiología Interactiva',
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
} 