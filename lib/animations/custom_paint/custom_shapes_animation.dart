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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: CustomPaint(
        painter: Polygon(sides: 3),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
