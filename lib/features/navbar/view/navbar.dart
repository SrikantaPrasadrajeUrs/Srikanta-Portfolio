import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/constants/constants.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final navItems = ["Home", "About me", "Projects", "Contact"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: 1200,
            minHeight: 70
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAppIcon(),
              _buildNavItems(),
              Row(
                spacing: 10,
                children: [
                  _buildModeIcon(),
                  _buildLetsTalk(),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItems(){
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.white);
    return Row(
      spacing: 60,
      children: navItems.map((e) => Text(e, style: style)).toList(),
    );
  }

  Widget _buildAppIcon(){
    return SizedBox(
      height: 50,
      width: 100,
      child: Placeholder(),
    );
  }

  Widget _buildLetsTalk(){
    return Container(
      height: 50,
      width: 100,
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
      ),
      child: Text("Let's talk", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black)),
    );
  }

  Widget _buildModeIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white, width: .5)
      ),
      child: Image.asset(AssetPaths.sun, color: Colors.white),
    );
  }

  Widget _buildNavIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3)
      ),
      child: Image.asset(AssetPaths.tree),
    );
  }
}
