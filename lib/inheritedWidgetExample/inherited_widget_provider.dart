import 'package:flutter/material.dart';

class InheritedWidgetProvider extends InheritedWidget {
  final int? numberOfIdeas;
  final Function? increaseNumberOfIdeas;

  InheritedWidgetProvider(
      {this.numberOfIdeas, this.increaseNumberOfIdeas, required Widget child})
      : assert(child != null),
        super(child: child);

  static InheritedWidgetProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedWidgetProvider>();
  }

  @override
  bool updateShouldNotify(InheritedWidgetProvider oldWidget) {
    return numberOfIdeas != oldWidget.numberOfIdeas;
  }
}
