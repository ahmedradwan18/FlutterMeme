import 'package:flutter/material.dart';
import 'dart:math' as math;

class GreyWoman extends StatelessWidget {
  const GreyWoman({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 200, top: 280),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 200),
            child: Text(
              'Doing something\n useful',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 300,
            height: 400,
            child: Stack(
              children: [
                Transform.rotate(
                  angle: math.pi / 28.0,
                  child: Container(
                    color: Colors.black,
                    width: 90,
                    height: 210,
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 10,
                  child: SizedBox(
                    height: 210,
                    child: Row(
                      children: [
                        Align(
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(80)),
                              color: Color(0xff8a95a0),
                            ),
                            height: 170,
                            width: 35,
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50)),
                            color: Color(0xff8a95a0),
                          ),
                          height: 350,
                          width: 60,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  left: 20,
                  child: Transform.rotate(
                    angle: math.pi / 28.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffE3B4AC),
                      ),
                      height: 95,
                      width: 55,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 50,
                  child: Transform.rotate(
                    angle: math.pi / 12.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffE3B4AC),
                      ),
                      height: 110,
                      width: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
