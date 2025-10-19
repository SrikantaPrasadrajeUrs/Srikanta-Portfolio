import 'package:flutter/material.dart' show Color, Colors, TextTheme, ThemeExtension;
import 'package:google_fonts/google_fonts.dart';

class PortFolioColor extends ThemeExtension<PortFolioColor> {
  final Color scaffoldBgColor;
  final Color reverseColor;
  final Color lightReverseColor;
  final Color shadow;

  const PortFolioColor({
    required this.scaffoldBgColor,
    required this.reverseColor,
    required this.lightReverseColor,
    required this.shadow,
  });

  @override
  PortFolioColor copyWith({
    Color? scaffoldBgColor,
    Color? reverseColor,
    Color? lightReverseColor,
    Color? shadow,
  }) {
    return PortFolioColor(
      scaffoldBgColor: scaffoldBgColor ?? this.scaffoldBgColor,
      reverseColor: reverseColor ?? this.reverseColor,
      lightReverseColor: lightReverseColor ?? this.lightReverseColor,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  PortFolioColor lerp(covariant ThemeExtension<PortFolioColor>? other, double t) {
    if (other is! PortFolioColor) return this;
    return PortFolioColor(
      scaffoldBgColor: Color.lerp(scaffoldBgColor, other.scaffoldBgColor, t)!,
      reverseColor: Color.lerp(reverseColor, other.reverseColor, t)!,
      lightReverseColor: Color.lerp(lightReverseColor, other.lightReverseColor, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }

  // Light theme
  static final PortFolioColor light = PortFolioColor(
    scaffoldBgColor: const Color.fromRGBO(248, 247, 241, 1),
    reverseColor: Colors.black87,
    lightReverseColor: Colors.black54, // lighter shade of reverseColor
    shadow: Colors.black45,
  );

  // Dark theme
  static final PortFolioColor dark = PortFolioColor(
    scaffoldBgColor: const Color.fromRGBO(41, 45, 59, 1),
    reverseColor: const Color.fromRGBO(183, 183, 183, 1),
    lightReverseColor:  const Color.fromRGBO(183, 183, 183, .2), // lighter version for dark mode
    shadow: Colors.white70,
  );
}
