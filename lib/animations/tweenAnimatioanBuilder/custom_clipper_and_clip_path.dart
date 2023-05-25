import 'package:animation/data/clipper_constant.dart';
import 'package:flutter/material.dart';

class CustomClipperPath extends StatefulWidget {
  const CustomClipperPath({Key? key}) : super(key: key);

  @override
  State<CustomClipperPath> createState() => _CustomClipperPathState();
}

class _CustomClipperPathState extends State<CustomClipperPath> {
  @override
  Widget build(BuildContext context) {
    var _color = getRandomColor();

    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: TweenAnimationBuilder(
            tween: ColorTween(
              begin: getRandomColor(),
              end: _color,
            ),
            onEnd: () {
              setState(() {
                _color = getRandomColor();
              });
            },
            duration: const Duration(seconds: 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
            builder: (context, Color? color, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcATop,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }
}
