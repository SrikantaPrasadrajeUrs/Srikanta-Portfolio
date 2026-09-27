import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';
import 'package:srikanta_portfolio/features/home/widgets/greeting_widget.dart';
import 'package:srikanta_portfolio/features/home/widgets/home_profile.dart';
import 'package:srikanta_portfolio/features/home/widgets/light_dark_mode.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final currentHour = DateTime.now().hour;
  late final ValueNotifier<bool> profileAnimationNotifier;

  @override
  void initState() {
    super.initState();
    profileAnimationNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    profileAnimationNotifier.dispose();
    super.dispose();
  }

  void onGreetingWidgetAnimationComplete(){
    profileAnimationNotifier.value = true;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            GreetingWidget(onAnimationEnd: onGreetingWidgetAnimationComplete),
            Align(alignment: Alignment.topRight, child: LightDarkMode()),
            Positioned(
              top: (height - AppSizes.profileCodingAnimation) / 2,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(width: 200, height: 200, child: Text("EMPTY")),
                  ValueListenableBuilder(
                    valueListenable: profileAnimationNotifier,
                    builder: (context, value, _) {
                      return HomeProfile(animate: value);
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
