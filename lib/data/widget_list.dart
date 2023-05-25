import 'package:animation/animations/explicit_animation/chained_animation.dart';
import 'package:animation/animations/explicit_animation/horo_animations/hero_animation_displace.dart';
import 'package:animation/animations/explicit_animation/square_rotating.dart';
import 'package:animation/animations/explicit_animation/stack_and_rotate_3D.dart';
import 'package:animation/animations/implicit_animations/animated_container_image.dart';
import 'package:animation/animations/tweenAnimatioanBuilder/custom_clipper_and_clip_path.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget> animationWidgets = {
  "Square Rotation Z": const SquareRotating(),
  "Chained Animation": const ChainedAnimation(),
  "Stack And Rotate 3D": const StackAndRotate3D(),
  "Hero Animation Displace": const Displace(),
  "Animated Container Widget": const AnimatedContainerImage(),
  "Tween Animation Builder": const CustomClipperPath(),
};

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({required this.name, required this.age, required this.emoji});
}
