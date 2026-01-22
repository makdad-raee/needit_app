import 'package:flutter/material.dart';
import 'package:needit_app/constant.dart';

class BlackCircleLogin extends StatelessWidget {
  const BlackCircleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(radius: 12, backgroundColor: kprimaryColor);
  }
}
