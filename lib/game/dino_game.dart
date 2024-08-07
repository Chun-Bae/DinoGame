import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import '../components/dino.dart';
import '../components/obstacle_manager.dart';

class DinoGame extends FlameGame with HasCollisionDetection {
  late Dino _dino;
  late ObstacleManager _obstacleManager;
  late Function onGameOver;
  DinoGame({required this.onGameOver});

  @override
  Future<void> onLoad() async {
    await images.loadAll(['dino.png', 'cactus.png', 'background.png']);

    final parallaxComponent = await ParallaxComponent.load(
      [ParallaxImageData('background.png')],
      size: size,
      baseVelocity: Vector2(20, 0),
    );
    _dino = Dino();
    _obstacleManager = ObstacleManager();

    add(parallaxComponent);
    add(_dino);
    add(_obstacleManager);
  }

  void reset() {
    _dino.reset();
    _obstacleManager.reset();
    resumeEngine();
  }

  get dino => _dino;
}
