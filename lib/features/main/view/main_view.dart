import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';
import 'package:srikanta_portfolio/features/navbar/view/navbar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding, vertical: AppSizes.padding),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Navbar()
          ],
        ),
      ),
    );
  }


}
