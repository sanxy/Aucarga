import 'package:etcetera/utils/tools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColors {
  //primary
  static Color bluePrimary = const Color(0xFF003366);
  static Color primarySwatch = const Color(0xFF003399).withOpacity(0.7);
  static Color orangePrimary = const Color(0xFFDF6E05);
  static Color greyPrimary = Tools.hexToColor('#BCBBC2');

  static Color backgroundColor = const Color(0xFFF7F7F7);
  static Color fieldColor = Tools.hexToColor('#E4E8EE');

  static Color successfulColor = Tools.hexToColor('#1BB750');
  static Color errorColor = Tools.hexToColor('#EB1E1E');
  static Color activeStep = Tools.hexToColor('#D0D5DD');

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color grey = Colors.grey;
  static Color transparent = Colors.transparent;

  //informative
  static Color informativeGreen = Tools.hexToColor('#4CD964');
  static Color informativeYellow = Tools.hexToColor('#FFAA2A');
  static Color informativeRed = Tools.hexToColor('#EC4F3C');

  //dark theme colors
   static Color darkBackgroundColor = const Color(0xFF191B20);
  static Color darkModeWhite = Tools.hexToColor("#D1D1D2");
  static Color darkModeGrey = const Color(0xFF222429);
  static Color darkModeGreyListTile = Tools.hexToColor("#2A2B2C");
  static Color darkCardBackgroundColor = Tools.hexToColor("#2D2F34");
}
