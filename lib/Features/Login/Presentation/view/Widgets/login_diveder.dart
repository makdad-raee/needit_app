import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          color: Colors.grey,
          width: MediaQuery.of(context).size.width * 0.31,
        ),
        const SizedBox(width: 4),
        Text(
          'Or',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 10,
            fontFamily: kRubikRubikMedium,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          height: 1,
          color: Colors.grey,
          width: MediaQuery.of(context).size.width * 0.31,
        ),
      ],
    );
  }
}
