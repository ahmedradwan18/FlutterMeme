import 'package:flutter/material.dart';
import 'package:flutter_meme/bottom_nav/bottomNav.dart';

import '../screen_with_transition.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, _) {
                      return SecondScreen();
                    },
                    opaque: false));
              },
              child: const Icon(
                Icons.card_giftcard,
                size: 46,
                color: Colors.white,
              ))),
    );
  }
}
