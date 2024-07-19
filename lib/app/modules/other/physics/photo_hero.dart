import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.iconData,
    this.onTap,
    required this.heroTag,
  });

  final String heroTag;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: heroTag,
        flightShuttleBuilder:
            (flightContext, animation, direction, fromContext, toContext) {
          return const Icon(Icons.accessibility_new, size: 150.0);
        },
        placeholderBuilder: (context, heroSize, child) {
          return const SizedBox(
            height: 150.0,
            width: 150.0,
            child: CircularProgressIndicator(color: Colors.redAccent),
          );
        },
        transitionOnUserGestures: true,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Icon(iconData, size: 150, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
