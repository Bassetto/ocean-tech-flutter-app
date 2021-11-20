import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Carregando..."),
          SizedBox(
            height: 30,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
