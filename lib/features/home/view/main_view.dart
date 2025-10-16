import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/themes/app_theme.dart';
import 'package:srikanta_portfolio/features/home/view/light_dark_mode.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final currentHour = DateTime.now().hour;

  String getGreeting() {
    return switch (currentHour) {
      < 12 => "Good Morning",
      < 17 => "Good Afternoon",
      < 21 => "Good Evening",
      _ => "Night Owl!",
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            buildGreetingWidget(),
            Align(alignment: Alignment.topRight, child: LightDarkMode()),
          ],
        ),
      ),
    );
  }

  Widget buildGreetingWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hello",
          style: AppTheme.typography(context).kantumruyPro.displayLarge,
        ),
        Text(
          getGreeting(),
          style: AppTheme.typography(context).kantumruyPro.displayLarge,
        ),
      ],
    );
  }
}
