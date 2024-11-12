import 'package:flutter/material.dart';
import 'package:player_animation/player_animation.dart';

void main() {
  runApp(const AnimationExample());
}
class AnimationExample extends StatefulWidget {
  const AnimationExample({super.key});

  @override
  State<AnimationExample> createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: AnimationPlayer(
          begin: 100,
          end: 200,
          duration: const Duration(seconds: 1),
          play: true,
          loop: true,
          builder: (context, controller, child, animation) {
          return Center(
              child: Container(
                width: animation.value,
                height: animation.value,
                color: Colors.red,
              ),
          );
        }),
      ),
    );
  }
}