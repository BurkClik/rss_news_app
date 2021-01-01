import 'package:flutter/material.dart';
import 'package:multicamp_news_app/screens/login.dart';
import 'package:multicamp_news_app/theme/constants.dart';
import 'package:multicamp_news_app/theme/size_config.dart';

class Splash extends StatefulWidget {
  static String routeName = '/slash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/news.png",
              height: getProportionateScreenHeight(160),
              width: getProportionateScreenWidth(160),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Text(
              'News App',
              style: kSplashTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionDuration: Duration(seconds: 3),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        ScaleTransition(
      scale: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animation, curve: Curves.fastLinearToSlowEaseIn),
      ),
      child: child,
    ),
  );
}
