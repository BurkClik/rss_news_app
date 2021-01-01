import 'package:flutter/material.dart';
import 'package:multicamp_news_app/theme/constants.dart';
import 'package:multicamp_news_app/theme/size_config.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: getProportionateScreenWidth(304),
            height: getProportionateScreenHeight(48),
            child: TextFormField(
              autocorrect: false,
              decoration: kSearchInputDeco,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 16.0),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(200),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://source.unsplash.com/random"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: getProportionateScreenHeight(200),
                      decoration: kNewsFilter,
                    ),
                    Align(
                      child: Text(
                        'Burak',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
