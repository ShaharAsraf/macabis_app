import 'package:flutter/material.dart';

const Color scaffoldBackground = Color(0xFFEFF8FF);
const Color cardColor = Colors.white;
const Color progressColor = Color(0xFF1EA6FF);
const Color cardShadowColor = Color(0x80C5C5C5);
const Color appBarColor = Colors.black54;
const LinearGradient categoryTitleGradient = LinearGradient(
  colors: [
    Colors.transparent,
    Colors.black87,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const LinearGradient categoryStockGradient = LinearGradient(
  colors: [
    Colors.black87,
    Colors.transparent,
  ],
  end: Alignment.bottomCenter,
  begin: Alignment.topCenter,
);

const TextStyle cardNameStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);
const TextStyle cardPrice = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
