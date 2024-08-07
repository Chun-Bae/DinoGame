import 'package:flutter/material.dart';

class GameOverDialog extends StatelessWidget {
  final VoidCallback onReset;

  const GameOverDialog({Key? key, required this.onReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.grey.shade800,
      contentPadding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 32.0),
      titlePadding: const EdgeInsets.all(24.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Game Over',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 40.0),
          child: Text(
            'Do you want to restart the game?',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: OutlinedButton(
            onPressed: onReset,
            style: OutlinedButton.styleFrom(
              overlayColor: Colors.black,
              side: BorderSide(color: Color.fromARGB(255, 192, 255, 75)),
            ),
            child: const Text(
              'Restart',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}