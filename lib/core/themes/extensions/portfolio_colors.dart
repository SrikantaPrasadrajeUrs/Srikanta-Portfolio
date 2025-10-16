import 'package:flutter/material.dart' show Color, Colors, TextTheme, ThemeExtension;
import 'package:google_fonts/google_fonts.dart';

class PortFolioColor extends ThemeExtension<PortFolioColor> {
  final Color scaffoldBgColor;
  final Color reverseColor;
  final Color shadow;

  const PortFolioColor({
    required this.scaffoldBgColor,
    required this.reverseColor,
    required this.shadow,
  });

  @override
  ThemeExtension<PortFolioColor> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<PortFolioColor> lerp(
    covariant ThemeExtension<PortFolioColor>? other,
    double t,
  ) {
    if (other is! PortFolioColor) return this;
    return PortFolioColor(
      scaffoldBgColor: Color.lerp(scaffoldBgColor, other.scaffoldBgColor, t)!,
      reverseColor: Color.lerp(reverseColor, other.reverseColor, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }

  static PortFolioColor light = PortFolioColor(
    scaffoldBgColor: Color.fromRGBO(248, 247, 241, 1),
    reverseColor: Colors.black54,
    shadow: Colors.black45,
  );
  static PortFolioColor dark = PortFolioColor(
    scaffoldBgColor: Color.fromRGBO(41, 45, 59, 1),
    reverseColor: Color.fromRGBO(183, 183, 183, 1),
    shadow: Colors.white70,
  );
}
