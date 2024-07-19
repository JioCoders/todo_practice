import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Game2View extends StatelessWidget {
  const Game2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: GameWidget(
      backgroundBuilder: (context) => Container(color: Colors.brown.shade100),
      game: GameWorld(),
    ));
  }
}

class GameWorld extends FlameGame {
  late SquareGameComponent square;

  @override
  Color backgroundColor() => Colors.redAccent.shade100;

  @override
  Future<void> onLoad() async {
    debugPrint("Lifecycle: SquareGame onLoad");
    square = SquareGameComponent();
    square.position = Vector2(0, 100);
    square.size = Vector2(100, 100);
    add(square);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    debugPrint("Lifecycle: SquareGame render");
  }

  @override
  void onMount() {
    super.onMount();
    debugPrint("Lifecycle: SquareGame onMount");
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    debugPrint("Lifecycle: SquareGame onGameResize");
  }

  @override
  void update(double dt) {
    super.update(dt);
    debugPrint("Lifecycle: SquareGame update");
  }
}

class SquareGameComponent extends PositionComponent {
  static const double speed = 20;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    debugPrint("Lifecycle: SquareGameComponent render");

    final paint = Paint()..color = Colors.blue;
    canvas.drawRect(position & size, paint);

    // canvas.drawRect(size.toRect(), paint);
  }

  @override
  void update(double dt) {
    super.update(dt);

    debugPrint("Lifecycle: SquareGameComponent update");
    position.x += speed * dt;
  }

  @override
  void onMount() {
    super.onMount();
    debugPrint("Lifecycle: SquareGameComponent onMount");
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    debugPrint("Lifecycle: SquareGameComponent onGameResize");
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    debugPrint("Lifecycle: SquareGameComponent onLoad");
  }
}
