import 'package:animation/animations/chained_animation.dart';
import 'package:animation/animations/horo_animations/hero_animation_displace.dart';
import 'package:animation/animations/square_rotating.dart';
import 'package:animation/animations/stack_and_rotate_3D.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget> animationWidgets = {
  "Square Rotation Z": const SquareRotating(),
  "Chained Animation": const ChainedAnimation(),
  "Stack And Rotate 3D": const StackAndRotate3D(),
  "Hero Animation Displace": const Displace(),
};
