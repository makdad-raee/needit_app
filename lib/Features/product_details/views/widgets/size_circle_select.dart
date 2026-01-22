import 'package:flutter/material.dart';

class SizeCircle extends StatelessWidget {
  const SizeCircle({
    super.key,
    required this.size,
    required this.color,
  });
  final String size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.5,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 18,
        child: Text(
          size,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13,
              color: color == Colors.white ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
