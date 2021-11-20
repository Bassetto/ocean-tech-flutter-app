import 'package:flutter/material.dart';
import 'package:ocean_tech/app/screens/home/home_screen.dart';
import 'package:ocean_tech/app/screens/report_details/report_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ocean Tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => HomeScreen(),
        "report_details": (context) => ReportDetailsScreen(),
      },
    );
  }
}