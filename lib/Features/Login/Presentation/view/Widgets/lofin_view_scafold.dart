import 'package:flutter/material.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/black_circle_login.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/login_view_circle_item.dart';

class LoginViewScafold extends StatelessWidget {
  const LoginViewScafold({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 12,
            top: MediaQuery.of(context).size.height * 0.05,
            child: const LoginViewCirclesItem(),
          ),
          Positioned(
            right: MediaQuery.of(context).size.height * 0.04,
            top: 2.5,
            child: const LoginViewCirclesItem(),
          ),
          Positioned(
            right: 2,
            top: MediaQuery.of(context).size.height * 0.25,
            child: const LoginViewCirclesItem(),
          ), //right circle
          Positioned(
            left: MediaQuery.of(context).size.width * 0.25,
            top: 22,
            child: const BlackCircleLogin(),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.02,
            top: MediaQuery.of(context).size.height * 0.19,
            child: const BlackCircleLogin(),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.33,
            child: const BlackCircleLogin(),
          ),
          Positioned(
            left: 0,
            top: MediaQuery.of(context).size.height * 0.037,
            child: const Icon(Icons.arrow_back, size: 32),
          ),
        ],
      ),
    );
  }
}
