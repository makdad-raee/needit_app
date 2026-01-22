import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class orderDetilsItemForHorizental extends StatelessWidget {
  const orderDetilsItemForHorizental({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xff00000017),
            blurRadius: 20,
            offset: Offset(0, 0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Image.network(photos[index], fit: BoxFit.fitWidth),
    );
  }
}
