import 'package:flutter/material.dart';
import 'package:srikanta_portfolio/core/utils/responsive.dart';
import '../../../core/themes/app_theme.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({super.key});

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget>  with TickerProviderStateMixin{

  late final AnimationController controller;
  late final Animation<Offset> fromTop;
  late final Animation<Offset> fromBottom;
  late final Animation<double> opacityAnimation;
  late final List<Greeting> greetings;

  late final AnimationController opacityController;
  late final Animation<double> opacityAnimation2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    opacityController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));

    fromTop = Tween<Offset>(begin: const Offset(0, -2), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    fromBottom = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: const Interval(.4, 1, curve:Curves.decelerate)));
    opacityAnimation = Tween<double>(begin: .2, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));

    opacityAnimation2 = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: opacityController, curve: Curves.easeInBack));

    greetings = getGreeting();
    WidgetsBinding.instance.addPostFrameCallback((_){
      controller.addStatusListener(onAnimationComplete);
      controller.forward();
    });
  }

  void onAnimationComplete(AnimationStatus status) {
    if(!status.isCompleted) return;
    opacityController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: opacityAnimation2,
              child: Text(
                'Hello',
                style: scaleTextValue(AppTheme.typography(context).kantumruyPro.displayLarge!, constraints: constraints),
              ),
            ),
            SizedBox(width: 30,),
            FadeTransition(
              opacity: opacityAnimation2,
              child: FadeTransition(
                opacity: opacityAnimation,
                child: Row(
                  children:
                      greetings
                          .map(
                            (part) => SlideTransition(
                              position: part.direction,
                              child: Text(
                                part.text,
                                style: scaleTextValue(AppTheme.typography(
                                  context,
                                ).kantumruyPro.displayLarge!.copyWith(
                                  fontSize: 110,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.color(context).lightReverseColor,
                                ), constraints: constraints),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  List<Greeting> getGreeting() {
    List<String> parts = switch (DateTime.now().hour) {
      < 12 => ['Good', ' Morning'],
      < 17 => ['Good', ' Afternoon'],
      < 21 => ['Good', ' Evening'],
      _ => ['Night', ' Owl!'],
    };
    return [
      Greeting(text: parts[0], direction: fromTop),
      Greeting(text: parts[1], direction: fromBottom),
    ];
  }
}

class Greeting{
  final String text;
  final Animation<Offset> direction;
  const Greeting({required this.text, required this.direction});
}