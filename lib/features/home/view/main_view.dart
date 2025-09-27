import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      children: [
        Text(
          "Hello",
          style: GoogleFonts.kantumruyPro(
            fontSize: 150,
            fontWeight: FontWeight.w500,
            letterSpacing: .2,
          ),
        ),
        Text(
          getGreeting(),
          style: GoogleFonts.poppins(
            fontSize: 108,
            fontWeight: FontWeight.w200,
            letterSpacing: .2,
          ),
        ),
      ],
    );
  }
}
