import 'package:flutter/material.dart';

class CircleInsideCircle extends StatelessWidget {
  const CircleInsideCircle(
      {super.key,
      required this.radius,
      this.backgroundColor = Colors.black,
      this.backgroundColor2});
  final double radius;
  final Color? backgroundColor;
  final Color? backgroundColor2;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor2 ?? Colors.white,
      child: CircleAvatar(
        radius: radius - 1,
        backgroundColor: backgroundColor ?? Colors.black,
      ),
    );
  }
}
