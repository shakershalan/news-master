import 'package:flutter/material.dart';

class MyTheme {
  static Color greenColor = Color(0xff39A552);
  static Color blackColor = Color(0xb2000000);
  static Color witheColor = Color(0xffffffff);
  static Color greyColor = Color(0xABA3A3A3);
  static Color redColor = Color(0xFFC91C22);
  static Color blueColor = Color(0xFA003E90);
  static Color pinkColor = Color(0xFAED1E79);
  static Color brownColor = Color(0xFACF7E48);
  static Color envirColor = Color(0xFD4882CF);
  static Color yellowColor = Color(0xFDF2D352);
  static ThemeData lightTheme = ThemeData(
      primaryColor: greenColor,
      appBarTheme: AppBarTheme(
        color: greenColor,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: witheColor,
          ),
          titleMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          titleSmall: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: blackColor,
          )),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none)));
}
