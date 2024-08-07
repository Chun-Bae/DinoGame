import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/collisions.dart';

class Obstacle extends SpriteComponent with CollisionCallbacks {
  Obstacle(Vector2 position)
      : super(
          size: Vector2(50, 50),
          position: position,
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('cactus.png');
    add(RectangleHitbox(
      size: Vector2(30, 30),
      position: Vector2(10, 10),
    ));
    debugMode = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= 200 * dt;

    if (position.x < -size.x) {
      removeFromParent();
    }
  }
}
