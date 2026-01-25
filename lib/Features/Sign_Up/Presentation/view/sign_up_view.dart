import 'package:flutter/material.dart';
import 'package:needit_app/Features/Sign_Up/Presentation/view/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: EdgeInsets.symmetric(
      //       horizontal: 20.0,
      //       vertical: 30,
      //     ), //EdgeInsets.all(20),
      //     child:
      //   ),
      // ),
      body: SignUpViewBody(),
    );
  }
}
