import 'screens/nav_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example app',
      debugShowCheckedModeBanner: false,
      home: NavScreen(),
    );
  }
}