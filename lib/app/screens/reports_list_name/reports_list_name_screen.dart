import 'package:flutter/material.dart';
import 'package:ocean_tech/app/model/mapping.dart';
import 'package:ocean_tech/app/screens/reports_list_name/components/body.dart';

class ReportsListNameScreen extends StatelessWidget {
  const ReportsListNameScreen({Key? key, required this.mapping}) : super(key: key);

  final Mapping mapping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(name: mapping.name),
    );
  }
}
