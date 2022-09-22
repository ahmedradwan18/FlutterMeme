import 'package:flutter/material.dart';

class RedWoman extends StatelessWidget {
  const RedWoman({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 300),
      child: Column(
        children: [
          const Text(
            'Making flutter meme',
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(
            height: 16,
          ),
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.black,
                    width: 120,
                    height: 110,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(25)),
                          color: Color(0xffE3B4AC),
                        ),
                        height: 230,
                        width: 45,
                      ),
                      Container(
                        color: const Color(0xffFD0002),
                        width: 120,
                        height: 230,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(25)),
                          color: Color(0xffE3B4AC),
                        ),
                        height: 230,
                        width: 45,
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                top: 20,
                left: 70,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE3B4AC),
                  ),
                  height: 115,
                  width: 75,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
