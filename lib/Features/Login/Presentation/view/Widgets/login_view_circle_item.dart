import 'package:flutter/material.dart';
import 'package:needit_app/Features/Home/views/widgets/circle_inside_circle.dart';

class LoginViewCirclesItem extends StatelessWidget {
  const LoginViewCirclesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CircleInsideCircle(
          radius: 75 / 2,
          backgroundColor: Colors.white,
          backgroundColor2: Colors.black38,
        ),
        CircleInsideCircle(
          radius: 65 / 2,
          backgroundColor: Colors.white,
          backgroundColor2: Colors.black38,
        ),
        CircleInsideCircle(
          radius: 57 / 2,
          backgroundColor: Colors.white,
          backgroundColor2: Colors.black38,
        ),
        CircleInsideCircle(
          radius: 43 / 2,
          backgroundColor: Colors.white,
          backgroundColor2: Colors.black38,
        ),
      ],
    );
  }
}
