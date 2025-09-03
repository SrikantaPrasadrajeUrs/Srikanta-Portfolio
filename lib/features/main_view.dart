import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srikanta_portfolio/core/themes/portfolio_colors.dart';
import 'package:srikanta_portfolio/features/blocs/theme_bloc/theme_bloc.dart';
import 'package:srikanta_portfolio/widgets/theme_builder.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ThemeBuilder()
              ],
            )
          ],
        ),
      ),
    );
  }
}
