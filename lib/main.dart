import 'package:flutter/material.dart';
import 'package:flutter_meme/widgets/blue_man.dart';
import 'package:flutter_meme/widgets/grey_woman.dart';
import 'package:flutter_meme/widgets/red_woman.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Meme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MemeScreen(),
    );
  }
}

class MemeScreen extends StatelessWidget {
  const MemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            RedWoman(),
            BlueMan(),
            GreyWoman(),
          ],
        ),
      ),
    );
  }
}
