import 'package:flutter/material.dart';

class AnimatedContainerImage extends StatefulWidget {
  const AnimatedContainerImage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerImage> createState() => _AnimatedContainerImageState();
}

double defaultWidth = 100;

class _AnimatedContainerImageState extends State<AnimatedContainerImage> {
  bool isZoomedIn = false;

  String buttonTitleZoomIn = "Zoom In";
  String buttonTitleZoomOut = "Zoom Out";
  double width = defaultWidth;
  var curve = Curves.bounceOut;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 370),
                width: width,
                curve: curve,
                child: Image.asset("assets/images/ocean.jpeg"),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isZoomedIn = !isZoomedIn;
                    width = (isZoomedIn)
                        ? MediaQuery.of(context).size.width
                        : defaultWidth;
                    curve =
                        (isZoomedIn) ? Curves.bounceInOut : Curves.bounceInOut;
                  });
                },
                child: Center(
                  child: Text(
                      (!isZoomedIn) ? buttonTitleZoomIn : buttonTitleZoomOut),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
