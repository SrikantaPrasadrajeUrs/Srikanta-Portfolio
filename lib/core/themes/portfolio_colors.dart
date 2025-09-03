
import 'package:flutter/material.dart' show Color, Colors, ThemeExtension;

class PortFolioColors extends ThemeExtension<PortFolioColors>{
  final Color scaffoldBgColor;
  final Color reverseColor;
  final Color shadow;

  const PortFolioColors({required this.scaffoldBgColor, required this.reverseColor, required this.shadow});

  @override
  ThemeExtension<PortFolioColors> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<PortFolioColors> lerp(covariant ThemeExtension<PortFolioColors>? other, double t) {
    if(other is! PortFolioColors) return this;
    return PortFolioColors(
        scaffoldBgColor: Color.lerp(scaffoldBgColor, other.scaffoldBgColor, t)!,
        reverseColor: Color.lerp(reverseColor, other.reverseColor, t)!,
        shadow: Color.lerp(shadow, other.shadow, t)!
    );
  }

  static const light = PortFolioColors(
      scaffoldBgColor: Color.fromRGBO(248,247,241,1),
      reverseColor: Colors.black,
      shadow: Colors.black
  );
  static const dark = PortFolioColors(
      scaffoldBgColor: Color.fromRGBO(41,45,59,1),
      reverseColor: Color.fromRGBO(183,183,183,1),
      shadow: Colors.white
  );

}