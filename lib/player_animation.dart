library player_animation;

import 'package:flutter/material.dart';


///A Widget that plays an animation based on tween that the given begin and end parameters.
///you can play animations without `SingleTickerProviderStateMixin` and `AnimationController` and just with begin and end parameters.
///you can play your animation in the loop or just once.
class AnimationPlayer extends StatefulWidget {
  ///start & end values of the animation.
  ///for example we have a `Container` with width 100 and height 100 and we want to animate it to 200 and 200
  ///just pass 100 to the begin and 200 to the end parameters
  final double begin, end;
  ///you can controll animation ("play" or "pause") with this boolean
  final bool play;
  ///if you want to play the animation again and again, set this to true
  final bool loop;
  ///duration of the animation
  final Duration duration;

  final Widget Function(BuildContext, AnimationController, Widget, Animation) builder;
  const AnimationPlayer({this.begin=0, this.end=100, required this.builder, this.duration = const Duration(seconds: 1), this.play = false, this.loop = false, super.key});

  @override
  State<AnimationPlayer> createState() => _AnimationPlayerState();
}

class _AnimationPlayerState extends State<AnimationPlayer> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    controller = AnimationController(vsync: this, duration: widget.duration);

    if (widget.loop) {
      controller.addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    }
    animation = Tween(begin: widget.begin, end: widget.end).animate(controller);
      
    if(widget.play) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if(widget.play) controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(widget.play) {
      return AnimatedBuilder(
      animation: controller,
      builder: (c, _) {
          return widget.builder(c, controller, _??Container(), animation);
      }
    );
    } else {
      return widget.builder(context, controller, Container(), animation);
    }
  }
}
