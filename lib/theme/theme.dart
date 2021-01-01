import 'package:flutter/material.dart';
import 'package:multicamp_news_app/theme/constants.dart';

ThemeData theme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
  );
}
