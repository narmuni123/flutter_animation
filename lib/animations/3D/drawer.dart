import 'package:animation/animations/3D/3D_drawer.dart';
import 'package:flutter/material.dart';

class DrawerThreeD extends StatefulWidget {
  const DrawerThreeD({Key? key}) : super(key: key);

  @override
  State<DrawerThreeD> createState() => _DrawerThreeDState();
}

class _DrawerThreeDState extends State<DrawerThreeD> {
  @override
  Widget build(BuildContext context) {
    return ThreeDDrawer(
      drawer: Material(
        child: Container(
          color: const Color(0xff242835),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 100, top: 100),
            itemCount: 20,
            itemBuilder: (_, int i) {
              return ListTile(
                title: Text(
                  "Item $i",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Drawer"),
        ),
        body: Container(
          color: const Color(0xff414868),
        ),
      ),
    );
  }
}
