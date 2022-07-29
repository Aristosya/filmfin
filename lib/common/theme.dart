import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
      color: Color.fromRGBO(220, 200, 232, 1)
  ),
    primaryColor: Color.fromRGBO(253, 233, 255,1),
    dividerColor: Color.fromRGBO(233, 219, 255,1),
    cardColor: Color.fromRGBO(32, 200, 221,1),
    unselectedWidgetColor: Color.fromRGBO(255, 219, 225,1),
);

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    color: Color.fromRGBO(235, 232, 202, 1)
  ),
  primaryColor: Color.fromRGBO( 107, 106, 92,1),
  dividerColor: Color.fromRGBO(247, 244, 213,1),
  cardColor: Color.fromRGBO(171, 169, 147,1),
  unselectedWidgetColor: Color.fromRGBO(209, 207, 180,1),
);