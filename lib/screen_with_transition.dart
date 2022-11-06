import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_meme/bottom_nav/bottomNav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, _) {
            return BottomNav(comingIndex: 0);
          },
          opaque: false));
      throw "";},
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 1200),
                  builder: (context, value, child) {
                    return ShaderMask(
                        shaderCallback: (rect) {
                          return RadialGradient(
                              radius:  double.parse(value.toString())*5     ,
                              colors: const [Colors.white, Colors.white, Colors.transparent, Colors.transparent], stops: [0.0, 0.55, 0.6, 1.0],
                              center: const FractionalOffset(0.95, 0.95))
                              .createShader(rect);
                        },
                        child: ParallaxEffect());
                  });
            },
          )),
    );
  }
}



class ParallaxEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
decoration: const BoxDecoration(gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [

    Color.fromARGB(255, 66, 240, 210),
    Color.fromARGB(255, 253, 244, 193),

  ]
)),
    );
  }
}




























