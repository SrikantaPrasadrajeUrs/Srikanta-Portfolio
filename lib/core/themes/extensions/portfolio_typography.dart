import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';
import 'package:srikanta_portfolio/core/themes/extensions/portfolio_colors.dart';

class PortfolioTypography extends ThemeExtension<PortfolioTypography> {
  /// TextTheme based on **Poppins** font family
  final TextTheme poppins;
  /// TextTheme based on **KantumruyPro** font family
  final TextTheme kantumruyPro;

  /// Create [PortfolioTypography] with provided [TextTheme]
  const PortfolioTypography({required this.poppins, required this.kantumruyPro});

  @override
  PortfolioTypography copyWith({TextTheme? poppins, TextTheme? kantumruyPro}) {
    return PortfolioTypography(poppins: poppins ?? this.poppins, kantumruyPro: kantumruyPro ?? this.kantumruyPro);
  }

  @override
  PortfolioTypography lerp(
    covariant ThemeExtension<PortfolioTypography>? other,
    double t,
  ) {
    if (other is! PortfolioTypography) return this;
    return PortfolioTypography(
      poppins: TextTheme.lerp(poppins, other.poppins, t),
      kantumruyPro: TextTheme.lerp(kantumruyPro, other.kantumruyPro, t)
    );
  }

  /// Builds a [TextStyle] with the given [fontFamily], [fontSize],
  /// [fontWeight], and [color].
  static TextStyle _buildTextStyle(
    FontFamily fontFamily,
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return switch (fontFamily) {
      FontFamily.kantumruyPro => GoogleFonts.kantumruyPro(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
      FontFamily.poppins => GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    };
  }


  /// Constructs a [TextTheme] using the provided [fontFamily] and [color].
  static TextTheme _buildTextTheme(Color color, FontFamily fontFamily) {
    return TextTheme(
      // Display Styles
      displayLarge: _buildTextStyle(fontFamily, 150, FontWeight.w400, color),
      displayMedium: _buildTextStyle(fontFamily, 45, FontWeight.w400, color),
      displaySmall: _buildTextStyle(fontFamily, 36, FontWeight.w400, color),

      // Headline Styles
      headlineLarge: _buildTextStyle(fontFamily, 32, FontWeight.w400, color),
      headlineMedium: _buildTextStyle(fontFamily, 28, FontWeight.w400, color),
      headlineSmall: _buildTextStyle(fontFamily, 24, FontWeight.w400, color),

      // Title Styles (Poppins — medium weight)
      titleLarge: _buildTextStyle(FontFamily.poppins, 22, FontWeight.w500, color),
      titleMedium: _buildTextStyle(FontFamily.poppins, 16, FontWeight.w500, color),
      titleSmall: _buildTextStyle(FontFamily.poppins, 14, FontWeight.w500, color),

      // Body Styles (Poppins — regular weight)
      bodyLarge: _buildTextStyle(FontFamily.poppins, 16, FontWeight.w400, color),
      bodyMedium: _buildTextStyle(FontFamily.poppins, 14, FontWeight.w400, color),
      bodySmall: _buildTextStyle(FontFamily.poppins, 12, FontWeight.w400, color),

      // Label Styles (Poppins — medium weight)
      labelLarge: _buildTextStyle(FontFamily.poppins, 14, FontWeight.w500, color),
      labelMedium: _buildTextStyle(FontFamily.poppins, 12, FontWeight.w500, color),
      labelSmall: _buildTextStyle(FontFamily.poppins, 11, FontWeight.w500, color),
    );
  }

  static PortfolioTypography light = PortfolioTypography(
    poppins: _buildTextTheme(PortFolioColor.light.reverseColor, FontFamily.poppins),
    kantumruyPro: _buildTextTheme(PortFolioColor.light.reverseColor, FontFamily.kantumruyPro),
  );

  static PortfolioTypography dark = PortfolioTypography(
    poppins: _buildTextTheme(PortFolioColor.dark.reverseColor, FontFamily.poppins),
    kantumruyPro: _buildTextTheme(PortFolioColor.dark.reverseColor, FontFamily.kantumruyPro),
  );
}

///
/// | **Text Style**     | **Purpose / Typical Use Case**                         | **Default Font Size** | **Weight**    | **Notes**                                   |
// | ------------------ | ------------------------------------------------------ | --------------------- | ------------- | ------------------------------------------- |
// | **displayLarge**   | Very large, bold title — splash screens, hero sections | 57                    | Regular (400) | Biggest text in the app                     |
// | **displayMedium**  | Large section titles, banners                          | 45                    | Regular (400) | Slightly smaller headline                   |
// | **displaySmall**   | Section headers, big quotes                            | 36                    | Regular (400) | Great for page headers                      |
// | **headlineLarge**  | Page titles or main content headings                   | 32                    | Regular (400) | Often used for titles in cards or dialogs   |
// | **headlineMedium** | Secondary headings                                     | 28                    | Regular (400) | Used inside large screens or sections       |
// | **headlineSmall**  | Tertiary headings                                      | 24                    | Regular (400) | Often bold and used in lists or card titles |
// | **titleLarge**     | Section or app bar title                               | 22                    | Medium (500)  | Commonly your AppBar title font             |
// | **titleMedium**    | Subtitle text, input labels                            | 16                    | Medium (500)  | Used for smaller titles and form labels     |
// | **titleSmall**     | Caption-style title, metadata                          | 14                    | Medium (500)  | Used for footers or small buttons           |
// | **bodyLarge**      | Main paragraph text                                    | 16                    | Regular (400) | Default readable body font                  |
// | **bodyMedium**     | Secondary text, list tiles                             | 14                    | Regular (400) | Typical for long content or descriptions    |
// | **bodySmall**      | Tertiary content, caption-like                         | 12                    | Regular (400) | Used for hints or helper text               |
// | **labelLarge**     | Buttons, chips                                         | 14                    | Medium (500)  | Often all-caps or bold for emphasis         |
// | **labelMedium**    | Small labels, badge text                               | 12                    | Medium (500)  | Used in compact buttons or pills            |
// | **labelSmall**     | Very small UI text, helper labels                      | 11                    | Medium (500)  | Used in tooltips, overlines, etc.           |
