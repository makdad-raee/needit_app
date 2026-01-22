import 'package:flutter/material.dart';
import 'package:needit_app/Features/Home/views/widgets/circle_inside_circle.dart';

class CirclesTopRigeht extends StatelessWidget {
  const CirclesTopRigeht({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -39,
          top: MediaQuery.of(context).size.height * 0.1,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              CircleInsideCircle(radius: 72),
              CircleInsideCircle(radius: 62),
              CircleInsideCircle(radius: 52),
              CircleInsideCircle(radius: 42),
            ],
          ),
        ),
        Positioned(
          right: 42.5,
          top: MediaQuery.of(context).size.height * 0.18,
          child: const CircleAvatar(radius: 19, backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
