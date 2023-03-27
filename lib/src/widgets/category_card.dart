import 'package:flutter/material.dart';

import '../style/colors.dart';

class CategoryCard extends StatelessWidget {
  final Widget child;
  const CategoryCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      child: Card(
        color: cardColor,
        clipBehavior: Clip.hardEdge,
        elevation: 5.0,
        shadowColor: cardShadowColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: child,
      ),
    );
  }
}
