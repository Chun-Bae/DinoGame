import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flame/game.dart';
import '../game/dino_game.dart';
import '../widgets/game_over_dialog.dart';

class DinoGamePage extends StatefulWidget {
  @override
  _DinoGamePageState createState() => _DinoGamePageState();
}

class _DinoGamePageState extends State<DinoGamePage> {
  final FocusNode _focusNode = FocusNode();
  late DinoGame game;

  @override
  void initState() {
    super.initState();
    game = DinoGame(onGameOver: _showGameOverDialog);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    setState(() {
      if (event is KeyDownEvent &&
          event.logicalKey == LogicalKeyboardKey.space) {
        game.dino.jump();
      }
    });
    return KeyEventResult.handled;
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return GameOverDialog(
          onReset: () {
            Navigator.of(context).pop();
            game.reset();
            FocusScope.of(context).requestFocus(_focusNode);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      autofocus: true,
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(_focusNode);
        },
        child: GameWidget(game: game),
      ),
    );
  }
}
