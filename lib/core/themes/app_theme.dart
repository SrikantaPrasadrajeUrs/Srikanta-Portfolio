import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/themes/extensions/portfolio_colors.dart';
import 'package:srikanta_portfolio/core/themes/extensions/portfolio_typography.dart';

class AppTheme{

  static PortFolioColor color(BuildContext context)=>Theme.of(context).extension<PortFolioColor>()!;
  static PortfolioTypography typography(BuildContext context)=>Theme.of(context).extension<PortfolioTypography>()!;

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    extensions: [PortFolioColor.light, PortfolioTypography.light],
    scaffoldBackgroundColor: PortFolioColor.light.scaffoldBgColor,
    textTheme: TextTheme(

    )
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      extensions: [PortFolioColor.dark, PortfolioTypography.dark],
      scaffoldBackgroundColor: PortFolioColor.dark.scaffoldBgColor,
  );

}