import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  final double maxSlide = 225.0;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  void toggle() => animationController!.isDismissed
      ? animationController!.forward()
      : animationController!.reverse();

  @override
  Widget build(BuildContext context) {
    Container myDrawer = Container(
      color: Colors.blue,
    );
    Container myChild = Container(
      color: Colors.yellow,
    );
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          double slide=maxSlide*animationController!.value;
          double scale=1-(animationController!.value*0.3);

          return Stack(
            children: [
              myDrawer,
              Transform(
                  transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(-math.pi/2*animationController!.value)
                  ,
                  alignment: Alignment.centerLeft,
                  child: myChild)
      /*        Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: myChild)*/
            ],
          );
        },

      ),
    );
  }
}
