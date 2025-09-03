import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srikanta_portfolio/core/utils/utils.dart';
import '../features/blocs/theme_bloc/theme_bloc.dart';

class ThemeBuilder extends StatefulWidget {
  const ThemeBuilder({super.key});

  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  final moonImage = Image.asset("images/moon_cool.png");
  final sunImage = Image.asset("images/sun.png");
  void toggleTheme()=>context.read<ThemeBloc>().add(ThemeChangeEvent());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleTheme,
      child: Container(
        height: 100,
        width: 60,
        padding: EdgeInsets.only(left:6, right: 6, top: 35),
        decoration: BoxDecoration(
            color: getCurrentTheme(context).reverseColor,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
        ),
        child: sunImage,
      ),
    );
  }
}
