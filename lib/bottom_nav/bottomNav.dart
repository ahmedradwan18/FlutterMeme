import 'package:flutter/material.dart';
import 'package:flutter_meme/bottom_nav/page1.dart';
import 'package:flutter_meme/bottom_nav/page2.dart';
import 'package:flutter_meme/bottom_nav/page3.dart';
import 'package:flutter_meme/bottom_nav/page4.dart';
import 'package:flutter_svg/svg.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import '../main.dart';

class BottomNav extends StatefulWidget {
  late int comingIndex = -1;

  BottomNav({Key? key, required this.comingIndex}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  /// Controller to handle PageView
  final _pageController = PageController();
  int currentIndex = 3;
  int maxCount = 4;

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const PageAnimator()
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print('init state');
    (widget.comingIndex != -1 && widget.comingIndex != null)
        ? currentIndex = widget.comingIndex
        : currentIndex = 3;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      print('widget binding');
      
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[currentIndex]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              pageController: _pageController,
              color: Colors.white,
              showLabel: false,
              bottomBarItems:  [
      /*          BottomBarItems(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItems(
                  inActiveItem: Icon(
                    Icons.star,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.star,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItems(
                  inActiveItem: Icon(
                    Icons.directions_car_sharp,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.directions_car_sharp,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItems(
                  inActiveItem: Icon(
                    Icons.camera_alt,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.camera_alt,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),*/

                /*           ///svg example
                BottomBarItems(
                  inActiveItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.blueGrey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/search_icon.svg',
                    color: Colors.black,
                  ),
                  itemLabel: 'Page 3',
                ),
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 4',
                ),
                const BottomBarItems(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Page 5',
                ),*/
              ],
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                _pageController.animateToPage(
                  currentIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              },
            )
          : null,
    );
  }
}
