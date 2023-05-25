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
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: Center(
        child: ClipPath(
          clipper: const CircleClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
