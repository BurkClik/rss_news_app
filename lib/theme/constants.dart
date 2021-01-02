import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFF93F7E);
const kSecondColor = Color(0xFFFC8B8E);

//=======================================
// Splash
//=======================================
const kSplashTextStyle = TextStyle(
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  fontSize: 24.0,
  color: kPrimaryColor,
);

//==================================
// AppBar
//==================================
const kAppBarText = TextStyle(
  fontFamily: 'Times New Roman',
  fontSize: 28,
  color: Colors.black,
);

//==================================
// Login and Register
//==================================
const kBlackWithOpacity = Color(0x80000000);
const kBlackOpacityInput = Color(0x59000000);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFA578E), Color(0xFFFDAA8E)],
);

const kWelcomeText = TextStyle(
  fontSize: 28,
  fontFamily: 'Kodchasan',
);

const kWelcomeHintText = TextStyle(
  fontSize: 16,
  fontFamily: 'Kodchasan',
  color: kBlackWithOpacity,
);

const kSignInputLabel = TextStyle(
  fontSize: 16.0,
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  color: kBlackOpacityInput,
);

const kSignInOutText = TextStyle(
  color: Colors.white,
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
);

const kSignHintText = TextStyle(
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  fontSize: 12.0,
);

const kSignAuthHintText = TextStyle(
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  fontSize: 12.0,
  color: kPrimaryColor,
);

//======================================
// Search
//======================================
const kSearchInputDeco = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
  floatingLabelBehavior: FloatingLabelBehavior.never,
  suffixIcon: Icon(Icons.search),
  labelText: 'Ara',
  labelStyle: TextStyle(fontFamily: 'Kodchasan'),
  filled: true,
  fillColor: Color(0x59FC8B8E),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(
      style: BorderStyle.none,
    ),
  ),
);

//========================================
// News
//========================================
const kNewsFilter = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.center,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Color(0xCC000000)],
  ),
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);

const kNewsTitle = TextStyle(
  fontFamily: 'Kodchasan',
  fontWeight: FontWeight.w600,
  fontSize: 16.0,
  color: Colors.white,
);
