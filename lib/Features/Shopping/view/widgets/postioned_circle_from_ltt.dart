import 'package:flutter/material.dart';
import 'package:needit_app/Features/Home/views/widgets/circle_inside_circle.dart';

class PostiondCirclesFromlt extends StatelessWidget {
  const PostiondCirclesFromlt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 8,
      top: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 65,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 55,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 45,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 35,
          ),
        ],
      ),
    );
  }
}
