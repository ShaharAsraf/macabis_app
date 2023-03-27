import 'package:flutter/material.dart';
import 'package:macabis_app/src/style/colors.dart';
import 'package:macabis_app/src/widgets/my_app_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [],
      ),
      appBar: const MyAppBar(),
    );
  }
}
