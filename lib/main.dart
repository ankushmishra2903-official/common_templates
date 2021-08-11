import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

    ),);
  }
}