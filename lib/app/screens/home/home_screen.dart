import 'package:flutter/material.dart';
import 'package:ocean_tech/app/components/app_bar_widget.dart';
import 'package:ocean_tech/app/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Body(),
    );
  }
}
