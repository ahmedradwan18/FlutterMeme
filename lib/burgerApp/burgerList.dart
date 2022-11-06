import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_meme/burgerApp/burgerPage.dart';

class BurgerList extends StatefulWidget {
  final int row;

  const BurgerList({Key? key, required this.row}) : super(key: key);

  @override
  _BurgerListState createState() => _BurgerListState();
}

class _BurgerListState extends State<BurgerList> {
  @override
  Widget build(BuildContext context) {
    Widget beefImage = Container(
      height: 160,
      child: Image.asset('assets/images/burger.png'),
    );
    Widget chickenImage = Container(
      height: 125,
      child: Image.asset('assets/images/burger2.png'),
    );

    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 330 : 250,
        margin: const EdgeInsets.only(top: 16, left: 10),
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 14),
                    width: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BurgerPage.tag);
                      },
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                index.isEven ? 'Chicken' : 'Beef',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    '15,45 \$ Le',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: Card(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        margin: EdgeInsets.all(7),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(45),
                                topLeft: Radius.circular(45),
                                bottomLeft: Radius.circular(45),
                                bottomRight: Radius.circular(15))),
                      ),
                    ),
                  ),
                  Positioned(

                    child: index.isEven ? InkWell(onTap: (){Navigator.of(context).pushNamed(BurgerPage.tag);},
                        child: chickenImage) : InkWell(
                        onTap: (){Navigator.of(context).pushNamed(BurgerPage.tag);},child: beefImage),
                    top: index.isEven ? 60 : 45,
                    left: index.isEven ? -4 : -13,
                  )
                ],
              );
            }),
      ),
    );
  }
}
