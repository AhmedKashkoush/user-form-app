import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void pushReplacement(Widget page) => Navigator.pushReplacement(
        this,
        MaterialPageRoute(builder: (context) => page),
      );

  void pop() => Navigator.pop(this);
}
