import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: AppBarTheme(
    color: Colors.black26
  ),
    primaryColor: Colors.white,
    dividerColor: Colors.grey.shade50,
);

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    color: Colors.white60
  ),
  primaryColor: Colors.black,
  dividerColor: Colors.grey,
);