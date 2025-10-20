import 'package:flutter/cupertino.dart';

enum DeviceType { mobile, tablet, desktop }

class Responsive {
  static DeviceType getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return DeviceType.mobile;
    } else if (width < 1200) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;
  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;
  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;
}

const double kBaseScreenWidth = 2048;
const kMaxFontScale = 1.3;
const kMinFontScale = 0.3;


/// Scales a [TextStyle]'s fontSize based on current screen width or provided constraints.
///
/// - Uses the *shortest side* of the screen for consistent scaling.
/// - Clamps scaling between [kMinFontScale] and [kMaxFontScale].
/// - Works both with [BuildContext] or [BoxConstraints].
TextStyle scaleTextValue(TextStyle textStyle, {BuildContext? context, BoxConstraints? constraints}){
  double? originalFS = textStyle.fontSize;
  if(originalFS==null) return textStyle;
  double? currentWidth = constraints!=null?constraints.maxWidth:context!=null?MediaQuery.of(context).size.shortestSide:null;
  if(currentWidth==null) return textStyle;
  double scale = (currentWidth/kBaseScreenWidth).clamp(kMinFontScale, kMaxFontScale);
  return textStyle.copyWith(fontSize: originalFS*scale);
}
