import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class GravityView extends StatefulWidget {
  const GravityView({super.key});

  @override
  State<GravityView> createState() => _GravityViewState();
}

class _GravityViewState extends State<GravityView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late GravitySimulation simulation;

  @override
  void initState() {
    super.initState();

    simulation = GravitySimulation(
      100.0, // acceleration
      0.0, // starting point
      500.0, // end point
      0.0, // starting velocity
    );

    controller = AnimationController(vsync: this, upperBound: 500)
      ..addListener(() {
        debugPrint('controllerValue==>${controller.value}');
        setState(() {});
      });

    controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(children: [
        Positioned(
          left: 50,
          top: controller.value,
          height: 10,
          width: 10,
          child: Container(
            color: Colors.redAccent,
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
