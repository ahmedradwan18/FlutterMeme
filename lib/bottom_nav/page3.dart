import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBallon(),
    );
  }
}

class AnimatedBallon extends StatefulWidget {
  const AnimatedBallon({Key? key}) : super(key: key);

  @override
  _AnimatedBallonState createState() => _AnimatedBallonState();
}

class _AnimatedBallonState extends State<AnimatedBallon>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animationFloatUp;
  Animation<double>? _animationGrowSize;

  double? _ballonHeight;
  double? _ballonWidth;
  double? _ballonBottomLocation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ballonHeight = MediaQuery.of(context).size.height / 2;
    _ballonWidth = MediaQuery.of(context).size.height / 3;
    _ballonBottomLocation = MediaQuery.of(context).size.height - _ballonHeight!;

    _animationFloatUp = Tween(begin: _ballonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController!,
            curve: const Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)));

    _animationGrowSize = Tween(begin: 50.0, end: _ballonWidth).animate(
        CurvedAnimation(
            parent: _animationController!,
            curve: const Interval(0.0, 0.5, curve: Curves.elasticInOut)));

    if (_animationController!.isCompleted) {
      _animationController!.reverse();
    } else {
      _animationController!.forward();
    }
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationFloatUp!,
      builder: (context, child) {
        return Container(
          color: Colors.amberAccent,
          child: child,
          margin: EdgeInsets.only(
              top: _animationFloatUp!.value,
              left: _animationGrowSize!.value * 0.5),
          width: _animationGrowSize!.value,
        );
      },
      child: GestureDetector(
        child: Image.asset(
          'assets/images/avatar.png',
          height: _ballonHeight,
          width: _ballonWidth,
        ),
        onTap: () {
          if (_animationController!.isCompleted) {
            _animationController!.reverse();
          } else {
            _animationController!.forward();
          }
        },
      ),
    );
  }
}
