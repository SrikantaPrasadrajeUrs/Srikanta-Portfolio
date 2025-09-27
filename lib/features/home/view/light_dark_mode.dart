import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srikanta_portfolio/blocs/theme_bloc/theme_bloc.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';
import 'package:srikanta_portfolio/core/utils/utils.dart';

class LightDarkMode extends StatefulWidget {
  const LightDarkMode({super.key});

  @override
  State<LightDarkMode> createState() => _LightDarkModeState();
}

class _LightDarkModeState extends State<LightDarkMode> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late AnimationController _widgetAnimationController;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<Offset> _widgetSlideAnimation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _widgetAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _widgetSlideAnimation =  Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -.1),
    ).animate(
      CurvedAnimation(parent: _widgetAnimationController, curve: Curves.ease),
    );
    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -10),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _widgetAnimationController.dispose();
    super.dispose();
  }

  void toggleTheme() {
    _animationController.forward().then((_) {
      context.read<ThemeBloc>().add(ThemeChangeEvent());
      _animationController.reverse();
    });
  }

  void hopWidget(bool isHovered){
    if(isHovered) _widgetAnimationController.forward();
    else _widgetAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_)=>hopWidget(true),
      onExit: (_)=>hopWidget(false),
      child: GestureDetector(
        onTap: toggleTheme,
        child: SlideTransition(
          position: _widgetSlideAnimation,
          child: SlideTransition(
            position: _imageSlideAnimation,
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                final currentImagePath = state.themeType==ThemeType.dark?AssetPaths.sun:AssetPaths.moon;
                return Container(
                  padding: const EdgeInsets.only(left: 6, right: 6, top: 30, bottom: 10),
                  decoration: BoxDecoration(
                    color: getCurrentTheme(context).reverseColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: getCurrentTheme(context).shadow,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Image.asset(currentImagePath, fit: BoxFit.contain, width: 50,),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
