import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Colors.lightBlueAccent,
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white),
    ),
  );
}