import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/features/home/widgets/greeting_widget.dart';
import 'package:srikanta_portfolio/features/home/widgets/light_dark_mode.dart';
import 'package:srikanta_portfolio/features/home/widgets/portfolio_selector.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final currentHour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            GreetingWidget(),
            Align(alignment: Alignment.topRight, child: LightDarkMode()),
            Align(
              alignment: Alignment.center,
              child: PortfolioSelector(),
            )
          ],
        ),
      ),
    );
  }
}
