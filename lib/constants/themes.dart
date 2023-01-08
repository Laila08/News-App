import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white
      )
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: HexColor('333739'),
      elevation: 0.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:HexColor('333739'),
          statusBarIconBrightness: Brightness.light
      ),
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
      selectedItemColor: Colors.deepOrange,
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey
  ),
);
ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.black
      )
  ),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      backgroundColor: Colors.white,
      elevation: 0.0,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Colors.white,
          statusBarIconBrightness: Brightness.dark
      ),
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.0
      ),
      iconTheme: IconThemeData(
          color: Colors.black
      )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 20.0,
      selectedItemColor: Colors.deepOrange,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey
  ),
);