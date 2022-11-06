import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                    height: size.height / 4,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(45),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 3,
                          )
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: 35,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/avatar.png'),
                                radius: 30,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Wanted Jack',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black54),
                                  child: const Text(
                                    'Gold Member',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              '154 \$ LE',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Positioned(
                child: Container(
                  height: 50,
                  width: size.width,
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          label: Text('What do you want to eat ?'),contentPadding: EdgeInsets.only(left: 8),
                          suffixIcon: Icon(Icons.search)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 3,color: Colors.white,
                  ),
                ),
                bottom: 0,
              )
            ],
          )
        ],
      ),
    );
  }
}
