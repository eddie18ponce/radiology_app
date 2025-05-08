import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(RadiologyApp());
}

class RadiologyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Radiología Interactiva',
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.white,
        textTheme: CupertinoTextThemeData(
          primaryColor: CupertinoColors.black,
          textStyle: TextStyle(
            color: CupertinoColors.black,
            fontSize: 16,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
} 