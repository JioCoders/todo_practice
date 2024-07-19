import 'package:flutter/material.dart';
import 'package:todo_flutter/app/modules/other/physics/photo_hero.dart';

//**
// Exception has occurred.
// FlutterError (_TweenViewState is a SingleTickerProviderStateMixin but multiple tickers were created.
// A SingleTickerProviderStateMixin can only be used as a TickerProvider once.
// If a State is used for multiple AnimationController objects, or if it is passed to other objects and those objects might use it more than one time in total, then instead of mixing in a SingleTickerProviderStateMixin, use a regular TickerProviderStateMixin.)
// */
class TweenView extends StatefulWidget {
  const TweenView({super.key, required this.hero});
  final bool hero;

  @override
  State<TweenView> createState() => _TweenViewState();
}

class _TweenViewState extends State<TweenView>
    // with SingleTickerProviderStateMixin {
    with
        TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  late Animation<Color?> colorAnimation;
  late AnimationController colorController;

  late AnimationController scaleController;
  late Animation<double?> scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Scale Animation
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      });
    scaleAnimation = Tween<double?>(
      begin: 0.5,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeInCirc));

    // Color Animation
    colorController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blueAccent, end: Colors.red)
        .animate(colorController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          colorController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          colorController.forward();
        }
      });

// Simple Animation
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 10, end: 300)
        .chain(CurveTween(curve: Curves.bounceIn))
        // .chain(CurveTween(curve: SinusCurve())) //custom curve
        .animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    scaleController.forward();
    colorController.forward();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Placeholder(
          child: widget.hero
              ? PhotoHero(
                  iconData: Icons.add,
                  heroTag: 'heroTag',
                  onTap: () => Navigator.pop(context))
              : Center(
                  child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: Container(
                      color: colorAnimation.value,
                      height: animation.value,
                      width: animation.value,
                      // height: 100,
                      // width: 100,
                    ),
                  ),
                )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    colorController.dispose();
    super.dispose();
  }
}
