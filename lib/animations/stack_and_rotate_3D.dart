import 'package:flutter/material.dart';

class StackAndRotate3D extends StatefulWidget {
  const StackAndRotate3D({Key? key}) : super(key: key);

  @override
  State<StackAndRotate3D> createState() => _StackAndRotate3DState();
}

class _StackAndRotate3DState extends State<StackAndRotate3D>
    with TickerProviderStateMixin {
  static const widthAndHeight = 100.0;

  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;
  late Tween<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            Stack(
              children: [
                container(color: Colors.red),
                container(color: Colors.red),
                container(color: Colors.red),
                container(color: Colors.red),
                container(color: Colors.red),
                container(color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget container({required Color color}) {
    return Container(
      height: widthAndHeight,
      width: widthAndHeight,
      color: color,
    );
  }
}
