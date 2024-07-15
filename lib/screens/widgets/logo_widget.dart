import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double? size;
  const LogoWidget({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Image(
        width: size,
        height: size,
        image: const AssetImage("assets/form.png"),
      ),
    );
  }
}
