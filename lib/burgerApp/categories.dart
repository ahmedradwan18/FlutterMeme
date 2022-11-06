import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int currentSelectedItem=0;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 100,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Stack(
                  children: [
                    Column(
                      children: [
                        Container(

                          margin: EdgeInsets.only(left: index == 0 ? 10 : 0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                currentSelectedItem=index;
                              });
                            },
                            child: Card(
                              color: index!=currentSelectedItem? Colors.white:Colors.black.withOpacity(0.7),
                              child: Icon(
                                Icons.fastfood,
                                color:index==currentSelectedItem? Colors.white:Colors.black.withOpacity(0.7),
                              ),
                              margin: EdgeInsets.all(10),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          height: 90,
                          width: 90,
                        )
                      ],
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(left: index == 0 ? 10 : 0),
                        width: 90,
                        child: Row(
                          children: [Spacer(), Text('Burger'), Spacer()],
                        ),
                      ),
                      bottom: 0,
                    )
                  ],
                )),
      ),
    );
  }
}
