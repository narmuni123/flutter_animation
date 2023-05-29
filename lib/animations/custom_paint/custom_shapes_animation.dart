import 'package:flutter/material.dart';

class CustomShapesAnimation extends StatefulWidget {
  const CustomShapesAnimation({Key? key}) : super(key: key);

  @override
  State<CustomShapesAnimation> createState() => _CustomShapesAnimationState();
}

class _CustomShapesAnimationState extends State<CustomShapesAnimation> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: CustomPaint(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
