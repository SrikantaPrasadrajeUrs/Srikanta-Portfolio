import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/themes/portfolio_colors.dart';

class AppTheme{
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    extensions: [PortFolioColors.light],
    scaffoldBackgroundColor: PortFolioColors.light.scaffoldBgColor,
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      extensions: [PortFolioColors.dark],
      scaffoldBackgroundColor: PortFolioColors.dark.scaffoldBgColor
  );

}