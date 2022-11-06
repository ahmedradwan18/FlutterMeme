import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'item_fader.dart';

class AnimatedPageWithKeys extends StatefulWidget {
  const AnimatedPageWithKeys({Key? key}) : super(key: key);

  @override
  _AnimatedPageWithKeysState createState() => _AnimatedPageWithKeysState();
}

class _AnimatedPageWithKeysState extends State<AnimatedPageWithKeys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: SafeArea(
          child: Stack(
            children: [
              const ArrowIcons(),
              const Plane(),
              const Line(),
              Page(
                answers: ['Business', 'Personals', 'Others'],
                number: 5,
                question:
                    'Do you typically fly for business , personal reasons or other reasons?',
                onOptionSelected: () => print('haha'),
              )
            ],
          ),
        ));
  }
}

class ArrowIcons extends StatelessWidget {
  const ArrowIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 8,
        bottom: 10,
        child: Column(
          children: const [
            Icon(
              Icons.arrow_upward,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
              Icons.arrow_circle_down,
              size: 40,
              color: Colors.white,
            )
          ],
        ));
  }
}

class Plane extends StatelessWidget {
  const Plane({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        left: 40,
        top: 32,
        child: RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.airplanemode_active_outlined,
            color: Colors.white,
            size: 64,
          ),
        ));
  }
}

class Line extends StatelessWidget {
  const Line({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 40 + 32,
        top: 40,
        bottom: 0,
        width: 1,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            color: Colors.white.withOpacity(0.5),
          ),
        ));
  }
}











class Page extends StatefulWidget {
  final int number;
  final String question;
  final List<String> answers;
  final VoidCallback onOptionSelected;

  const Page(
      {Key? key,
      required this.number,
      required this.question,
      required this.answers,
      required this.onOptionSelected})
      : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  late List<GlobalKey<_ItemFaderState>> keys;

  @override
  void initState() {
    super.initState();
    keys = List.generate(5, (index) => GlobalKey<_ItemFaderState>());
    onInit();
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 250));
      key.currentState!.show();
    }
  }

  void onTap() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(const Duration(milliseconds: 80));
      key.currentState!.hide();
    }
    await Future.delayed(const Duration(milliseconds: 100));
    onInit();
    widget.onOptionSelected();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        ItemFader(
          key: keys[0],
          child: Padding(
            padding: const EdgeInsets.only(left: 120, top: 20),
            child: Text(
              '0' + widget.number.toString(),
              style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ItemFader(
          key: keys[1],
          child: Padding(
            padding: const EdgeInsets.only(left: 120, top: 20),
            child: Text(widget.question.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                )),
          ),
        ),
        const Spacer(),
        ...widget.answers.map((answer) {
          int answerIndex = widget.answers.indexOf(answer);
          int keyIndex = answerIndex + 2;
          return Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              ItemFader(
                child: OptionItem(name: answer, onTap: onTap),
                key: keys[keyIndex],
              ),
            ],
          );
        }),
        const SizedBox(
          height: 64,
        )
      ],
    );
  }
}












class OptionItem extends StatefulWidget {
  final String name;
  final VoidCallback onTap;

  const OptionItem({Key? key, required this.name, required this.onTap})
      : super(key: key);

  @override
  _OptionItemState createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){


        widget.onTap();
      } ,
      child: Row(
        children: [
          const SizedBox(
            width: 60,
          ),
          const Icon(
            Icons.circle,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            width: 26,
          ),
          Expanded(
            child: Text(widget.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;

  const ItemFader({Key? key, required this.child}) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  // 1 means it's below , -1 it's above
  double position = 1;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        child: widget.child,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 64 * position * (1 - _animation.value)),
            child: Opacity(
              child: child,
              opacity: _animation.value,
            ),
          );
        });
  }

  void show() {
    setState(() {
      position = 1;
    });
    _animationController.forward();
  }

  void hide() {
    setState(() {
      position = -1;
    });
    _animationController.reverse();
  }

  Future<void> animateDot(Offset startOffset) async{
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      double minTop = MediaQuery.of(context).padding.top + 52;
      return AnimatedBuilder(
          animation: _animationController,child: const Icon(
        Icons.circle,
        color: Colors.white,
        size: 26,
      ),
          builder: (context, child) {
            return Positioned(
              child: child!,
              left: 76,
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
            );

          });
    });
    Overlay.of(context)!.insert(overlayEntry);
    await _animationController.forward(from: 0);
    overlayEntry.remove();
  }
}
