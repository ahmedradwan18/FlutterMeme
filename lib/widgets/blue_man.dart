import 'package:flutter/material.dart';
import 'dart:math' as math;

class BlueMan extends StatelessWidget {
  const BlueMan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 200, top: 245),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 70),
            child: Text(
              'Me',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 70),
                    child: Container(
                      color: Colors.black,
                      width: 90,
                      height: 110,
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 260,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(80)),
                      color: Color(0xff3186D6),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 15,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE3B4AC),
                  ),
                  height: 100,
                  width: 75,
                ),
              ),
              Positioned(
                top: 160,
                left: 45,
                child: Transform.rotate(
                  angle: math.pi / 22.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffE3B4AC),
                    ),
                    height: 180,
                    width: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
