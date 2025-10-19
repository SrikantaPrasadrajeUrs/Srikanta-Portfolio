import 'package:flutter/material.dart';
import '../../../core/themes/app_theme.dart';

class GreetingWidget extends StatefulWidget {
  const GreetingWidget({super.key});

  @override
  State<GreetingWidget> createState() => _GreetingWidgetState();
}

class _GreetingWidgetState extends State<GreetingWidget>  with SingleTickerProviderStateMixin{

  late final AnimationController controller;
  late final Animation<Offset> fromTop;
  late final Animation<Offset> fromBottom;
  late final Animation<double> opacityAnimation;
  late final List<Map<String,dynamic>> greetings;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    final curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    fromTop = Tween<Offset>(begin: Offset(0, -2), end: Offset.zero).animate(curvedAnimation);
    fromBottom = Tween<Offset>(begin: Offset(0, 2), end: Offset.zero).animate(curvedAnimation);
    opacityAnimation = Tween<double>(begin: .2, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInBack));
    greetings = getGreeting();
    WidgetsBinding.instance.addPostFrameCallback((_)=> controller.forward());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hello",
          style: AppTheme.typography(context).kantumruyPro.displayLarge,
        ),
        SizedBox(width: 30,),
        FadeTransition(
          opacity: opacityAnimation,
          child: Row(
            children:
                greetings
                    .map(
                      (part) => SlideTransition(
                        position: part['animation'],
                        child: Text(
                          part['text'],
                          style: AppTheme.typography(
                            context,
                          ).kantumruyPro.displayLarge!.copyWith(
                            fontSize: 110,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.color(context).lightReverseColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }

  List<Map<String,dynamic>> getGreeting() {
    List<String> parts = switch (DateTime.now().hour) {
      < 12 => ["Good", " Morning"],
      < 17 => ["Good", " Afternoon"],
      < 21 => ["Good", " Evening"],
      _ => ["Night", " Owl!"],
    };
    List<Map<String,dynamic>> greetingData = [];
    for(var i = 0; i < parts.length; i++){
      greetingData.add({
        "text":parts[i],
        "animation": i == 0 ? fromTop : fromBottom,
      });
    }
    return greetingData;
  }
}
