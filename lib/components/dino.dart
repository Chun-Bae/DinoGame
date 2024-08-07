import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import '../game/dino_game.dart';
import 'obstacle.dart';

class Dino extends SpriteComponent
    with CollisionCallbacks, HasGameRef<DinoGame> {
  double gravity = 800; // 중력 가속도
  double jumpSpeed = -400; // 점프 속도
  double verticalSpeed = 0; // 점프 또는 내려올 때의 속도
  bool isJumping = false;

  Dino()
      : super(
          size: Vector2(50, 50),
          position: Vector2(100, 400),
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('dino.png');
    add(RectangleHitbox(
      size: Vector2(30, 30),
      position: Vector2(10, 10),
    ));
    debugMode = true;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += verticalSpeed * dt;
    verticalSpeed += gravity * dt;

    // 땅에 닿으면 점프 중지
    if (position.y >= 400) {
      position.y = 400;
      isJumping = false;
      verticalSpeed = 0;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Obstacle) {
      gameRef.pauseEngine();
      gameRef.onGameOver();
    }
    super.onCollision(intersectionPoints, other);
  }

  void jump() {
    if (!isJumping) {
      isJumping = true;
      verticalSpeed = jumpSpeed;
    }
  }

  void reset() {
    position = Vector2(100, 400);
    isJumping = false;
    verticalSpeed = 0;
  }
}
