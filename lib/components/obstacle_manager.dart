import 'package:flame/components.dart';
import 'package:flame/game.dart';
import '../game/dino_game.dart';
import 'obstacle.dart';
import 'dart:math';

class ObstacleManager extends Component with HasGameRef<DinoGame> {
  final List<Obstacle> obstacles = [];
  final Random random = Random();
  double nextObstacleDistance = 0;

  @override
  void update(double dt) {
    super.update(dt);

    if (obstacles.isEmpty ||
        (gameRef.size.x - obstacles.last.position.x) > nextObstacleDistance) {
      final position = Vector2(gameRef.size.x, 400);
      final obstacle = Obstacle(position);
      obstacles.add(obstacle);
      gameRef.add(obstacle);

      nextObstacleDistance = random.nextDouble() * 200 + 300;
    }

    obstacles.removeWhere((obstacle) => obstacle.parent == null);
  }

  void reset() {
    for (final obstacle in obstacles) {
      obstacle.removeFromParent();
    }
    obstacles.clear();
    nextObstacleDistance = 0;
  }
}
