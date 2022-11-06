import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_meme/burgerApp/burgerPage.dart';
import 'package:flutter_meme/movie_app/screens/onbording_screen.dart';

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
        routes: {BurgerPage.tag: (_) => BurgerPage()},
        theme: ThemeData(
            primarySwatch: Colors.blue,
            cardColor: Colors.teal,
            appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
            bottomAppBarColor: Colors.teal,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.orange)),
        home:
            //const BurgerHome()
            //InheritedWidgetPage()
            //const AnimatedPageWithKeys()
            //  CustomDrawer()
            //  BottomNav(comingIndex: 0,),
            OnboardingScreen()
        //    const MemeScreen(),
        );
  }
}
