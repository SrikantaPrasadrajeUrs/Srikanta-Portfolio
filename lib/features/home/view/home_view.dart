import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/features/home/widgets/greeting_widget.dart';
import 'package:srikanta_portfolio/features/home/widgets/home_profile.dart';
import 'package:srikanta_portfolio/features/home/widgets/light_dark_mode.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  void onGreetingWidgetAnimationComplete() {
    profileAnimationNotifier.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

      ],
    );
  }
}
///
///
///         GreetingWidget(onAnimationEnd: onGreetingWidgetAnimationComplete),
//         Align(alignment: Alignment.topRight, child: LightDarkMode()),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(width: 200, height: 200, child: Text("EMPTY")),
//             ValueListenableBuilder(
//               valueListenable: profileAnimationNotifier,
//               builder: (context, value, _) {
//                 return HomeProfile(animate: value);
//               },
//             ),
//           ],
//         ),
///
///
///

