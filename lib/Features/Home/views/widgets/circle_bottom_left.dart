import 'package:flutter/material.dart';
import 'package:needit_app/Features/Home/views/widgets/circle_inside_circle.dart';

class CircleBottomLeft extends StatelessWidget {
  const CircleBottomLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -53,
          bottom: -MediaQuery.of(context).size.height * 0.011,
          child: const Stack(
            alignment: Alignment.center,
            children: [
              CircleInsideCircle(radius: 115),
              CircleInsideCircle(radius: 99),
              CircleInsideCircle(radius: 81.5),
              CircleInsideCircle(radius: 61),
            ],
          ),
        ),
        Positioned(
          left: 42,
          bottom: MediaQuery.of(context).size.height * 0.188,
          child: const CircleAvatar(radius: 24, backgroundColor: Colors.white),
        ),
        Positioned(
          left: 145,
          bottom: MediaQuery.of(context).size.height * 0.13,
          child: const CircleAvatar(radius: 9, backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
