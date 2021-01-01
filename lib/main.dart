import 'package:flutter/material.dart';
import 'package:multicamp_news_app/routes.dart';
import 'package:multicamp_news_app/screens/splash.dart';
import 'package:multicamp_news_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: routes,
    );
  }
}
