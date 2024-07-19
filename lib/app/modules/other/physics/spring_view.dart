import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringView extends StatefulWidget {
  const SpringView({super.key});

  @override
  State<SpringView> createState() => _SpringViewState();
}

class _SpringViewState extends State<SpringView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late SpringSimulation simulation;

  @override
  void initState() {
    super.initState();

    simulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 100,
        damping: 1,
      ),
      0.0, // starting point
      400.0, // ending point
      10, // velocity
    );

    controller = AnimationController(
      vsync: this,
      upperBound: 600,
    )..addListener(() {
        debugPrint('controllerValue==>${controller.value}');
        setState(() {});
      });

    controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: 150,
          top: controller.value,
          height: 20,
          width: 20,
          child: const Icon(
            Icons.accessibility_rounded,
            color: Colors.pinkAccent,
            size: 60,
          ),
        ),
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
