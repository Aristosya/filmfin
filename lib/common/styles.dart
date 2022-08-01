import 'package:flutter/material.dart';

abstract class ThemeText {
  static const TextStyle infoHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    overflow: TextOverflow.ellipsis,
    fontFamily: 'Montserrat',
    color: Colors.black,
  );

  static const TextStyle infoMedium = TextStyle(
      fontSize: 20,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);

  static const TextStyle infoSmall = TextStyle(
      fontSize: 15,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400);
}
