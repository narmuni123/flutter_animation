import 'dart:math';

import 'package:animation/data/clipper_constant.dart';
import 'package:flutter/material.dart';

class CustomShapesAnimation extends StatefulWidget {
  const CustomShapesAnimation({Key? key}) : super(key: key);

  @override
  State<CustomShapesAnimation> createState() => _CustomShapesAnimationState();
}

class _CustomShapesAnimationState extends State<CustomShapesAnimation>
    with TickerProviderStateMixin {
  late AnimationController _sidesController;
  late Animation<int> _sidesAnimation;

  late AnimationController _radiusController;
  late Animation<double> _radiusAnimation;

  late AnimationController _rotationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _sidesAnimation = IntTween(
      begin: 3,
      end: 10,
    ).animate(_sidesController);

    _radiusController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _radiusAnimation = Tween(
      begin: 20.0,
      end: 400.0,
    ).chain(CurveTween(curve: Curves.bounceInOut)).animate(_radiusController);

    _rotationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _rotationAnimation = Tween(
      begin: 0.0,
      end: 2.0 * pi,
    ).chain(CurveTween(curve: Curves.easeInOut)).animate(_rotationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _sidesController.repeat(reverse: true);
    _radiusController.repeat(reverse: true);
    _rotationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _sidesController,
            _radiusController,
            _rotationController,
          ]),
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateX(_rotationAnimation.value)
                ..rotateY(_rotationAnimation.value)
                ..rotateZ(_rotationAnimation.value),
              child: CustomPaint(
                painter: Polygon(sides: _sidesAnimation.value),
                child: SizedBox(
                  width: _radiusAnimation.value,
                  height: _radiusAnimation.value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
