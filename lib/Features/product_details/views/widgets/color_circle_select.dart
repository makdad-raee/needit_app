import 'package:flutter/material.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    super.key,
    required this.color,
    this.isSelected = false,
  });
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.5,
      backgroundColor: const Color(0xff707070),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 18,
        child: Icon(
          isSelected ? Icons.check : null,
          color: Colors.white,
        ),
      ),
    );
  }
}
