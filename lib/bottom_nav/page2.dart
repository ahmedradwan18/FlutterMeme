import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<String> avatars = [
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fhuman-avatar&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAE',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fman-avatar&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAJ',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.producthunt.com%2Fproducts%2Favatar-maker-2&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAq',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fhuman-avatar&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAE',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fman-avatar&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAJ',
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.producthunt.com%2Fproducts%2Favatar-maker-2&psig=AOvVaw2Ncgc8kMcTf1YKNibUGYd0&ust=1665653242322000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCOCmzYGw2voCFQAAAAAdAAAAABAq',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black38,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < avatars.length; i++)
             Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Align(
                      widthFactor: 0.5,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.black38,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(avatars[i]),
                        ),
                      ),
                    ),
                  )

            ],
          ),
        ),
      ),
    );
  }
}
