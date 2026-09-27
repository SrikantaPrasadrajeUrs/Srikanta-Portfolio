import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';

class HomeProfile extends StatefulWidget {
  final bool animate;
  const HomeProfile({super.key, this.animate = false});

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> with TickerProviderStateMixin {

  late final AnimationController slideAnimationController;
  late final Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    slideAnimationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slideAnimation = Tween<Offset>(begin: const Offset(10, 0), end: Offset.zero).animate(CurvedAnimation(parent: slideAnimationController, curve: Curves.decelerate));
  }

  @override
  void didUpdateWidget(covariant HomeProfile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate) slideAnimationController.forward();
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: SizedBox(
          width: AppSizes.profileCodingAnimation,
          height: AppSizes.profileCodingAnimation,
          child: Lottie.asset(AssetPaths.profileCodingAnimation, repeat: true, renderCache: RenderCache.raster)),
    );
  }
}