import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multicamp_news_app/screens/home_body.dart';
import 'package:multicamp_news_app/theme/constants.dart';
import 'package:multicamp_news_app/theme/size_config.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Haberler', style: kAppBarText),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: getProportionateScreenWidth(16)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/news.svg",
                        width: getProportionateScreenWidth(100),
                      ),
                      Text(
                        'News App',
                        style: TextStyle(
                          fontFamily: 'Kodchasan',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '1.0.0',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: kSecondColor,
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 240),
                  Text('Burak Çelik'),
                  SizedBox(height: getProportionateScreenHeight(240)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('burk.clik@gmail.com'),
                      IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: HomeBody(),
    );
  }
}
