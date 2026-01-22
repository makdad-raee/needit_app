import 'package:flutter/material.dart';
import 'package:needit_app/Features/Home/views/widgets/circle_inside_circle.dart';

class PostiondCirclesFromRt extends StatelessWidget {
  const PostiondCirclesFromRt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: 6,
      top: 174,
      child: Stack(
        // clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        children: [
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
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 25,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 15,
          ),
        ],
      ),
    );
  }
}

class PostiondCirclesFromcenter extends StatelessWidget {
  const PostiondCirclesFromcenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      right: -78,
      top: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 80,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 65,
          ),
          CircleInsideCircle(
            backgroundColor: Colors.white,
            backgroundColor2: Colors.black,
            radius: 50,
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
