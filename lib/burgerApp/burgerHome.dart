import 'package:flutter/material.dart';
import 'package:flutter_meme/burgerApp/burgerList.dart';
import 'package:flutter_meme/burgerApp/categories.dart';
import 'package:flutter_meme/burgerApp/header.dart';

class BurgerHome extends StatefulWidget {
  const BurgerHome({Key? key}) : super(key: key);

  @override
  _BurgerHomeState createState() => _BurgerHomeState();
}

class _BurgerHomeState extends State<BurgerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: BottomAppBar(shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_alarm, color: Colors.white)),
              Spacer(),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.turned_in,
                    color: Colors.white,
                  )),
              Spacer(),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Deliver me'),
            pinned: true,
            leading: Icon(Icons.menu),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
          const Header(),
          Categories(),
     BurgerList(row: 1,),
     BurgerList(row: 2,),

        ],
      ),
    );
  }
}
