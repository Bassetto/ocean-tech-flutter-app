import 'package:flutter/material.dart';
import 'package:ocean_tech/app/core/core.dart';
import 'components/body.dart';

class ReportStateYear extends StatelessWidget {
  const ReportStateYear({Key? key, required this.state, required this.year})
      : super(key: key);

  final String state;
  final int year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${state.replaceAll("-", " ").toTitleCase()} - $year"),
        centerTitle: true,
      ),
      body: Body(state: state, year: year),
    );
  }
}
