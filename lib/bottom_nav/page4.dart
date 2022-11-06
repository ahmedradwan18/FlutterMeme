import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageAnimator extends StatefulWidget {
  const PageAnimator({Key? key}) : super(key: key);

  @override
  State<PageAnimator> createState() => _PageAnimatorState();
}

class _PageAnimatorState extends State<PageAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              clipBehavior: Clip.none,
              children: [topBar(250), circle(size, 1)],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                placeHolderBox(28, 150, Alignment.centerLeft),
                SizedBox(
                  height: 8,
                ),
                placeHolderBox(280, double.infinity, Alignment.centerLeft)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      color: Colors.blue,
    );
  }

  Align placeHolderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300),
      ),
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 200,
      left: size.width / 2 - 50,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(animationValue, animationValue, 1),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.blue.shade700),
        ),
      ),
    );
  }
}
