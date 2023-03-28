import 'package:flutter/material.dart';
import 'package:macabis_app/src/style/colors.dart';

class MyLoader extends StatelessWidget {
  const MyLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: progressColor,
        strokeWidth: 2,
      ),
    );
  }
}
