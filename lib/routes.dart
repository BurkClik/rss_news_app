import 'package:flutter/widgets.dart';
import 'package:multicamp_news_app/screens/login.dart';
import 'package:multicamp_news_app/screens/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (context) => Splash(),
  Login.routeName: (context) => Login(),
};
