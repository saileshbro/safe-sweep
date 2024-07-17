import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const disabledColor = Color(0xFFbcbcbc);
const primaryColor = Color(0xFF0E2831);
const lightPrimaryCplor = Color(0xFFa0a6ff);
const secondaryColor = Color(0xFF282724);
const shutleGrey = Color(0xFFf4f4f4);
const errorColor = Color(0xFFF76567);
const successColor = Color(0xFF00da9f);
const warningColor = Color(0xFFfce8bb);
const warningIconColor = Color(0xFFf3b31c);
const darkGrey = Color(0xFF5b5b5b);
const lightGrey = Color(0xFFf3f6f9);
const chipGrey = Color(0xFFe1e1e1);
const cursorColor = Color(0xFF666666);
const bodyColor = Color(0xFF000000);
const buttonColor = Color(0xFFFFFFFF);
const inputSuffixIconClor = Color(0xFF6dd819);

final ThemeData appTheme = ThemeData.light().copyWith(
  primaryColor: primaryColor,
  textSelectionTheme: ThemeData.light().textSelectionTheme.copyWith(
        cursorColor: cursorColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: bodyColor,
      ),
  appBarTheme: ThemeData.light().appBarTheme.copyWith(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: primaryColor,
        ),
        elevation: 0,
      ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  scaffoldBackgroundColor: const Color(0xFFf7f7f7),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: primaryColor,
    ),
  ),
);
