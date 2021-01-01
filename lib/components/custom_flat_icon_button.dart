import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multicamp_news_app/theme/size_config.dart';

class CustomFlatIconButton extends StatelessWidget {
  final String wordThree;
  final String wordFour;
  final Function onPressed;

  CustomFlatIconButton({this.wordThree, this.wordFour, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        "assets/icons/google.svg",
        width: 24,
        height: 24,
      ),
      minWidth: getProportionateScreenWidth(308.0),
      height: getProportionateScreenHeight(48.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Color(0xFFEBEEF4),
      label: RichText(
        text: TextSpan(
          children: [
            customTextSpan('Google ', Color(0xFF4285F4)),
            customTextSpan('ile ', Color(0xFFEA4335)),
            customTextSpan(wordThree, Color(0xFFFBBC05)),
            customTextSpan(wordFour, Color(0xFF34A853))
          ],
        ),
      ),
    );
  }

  TextSpan customTextSpan(String text, Color color) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Kodchasan',
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
