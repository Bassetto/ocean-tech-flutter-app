import 'package:flutter/material.dart';
import 'package:ocean_tech/app/screens/report_details/components/body.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}
