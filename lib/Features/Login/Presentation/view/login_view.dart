import 'package:flutter/material.dart';
import 'package:needit_app/Features/Login/Presentation/view/Widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 30,
          ), //EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, size: 30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0), //EdgeInsets.all(20.0),
        child: LoginViewBody(),
      ),
    );
  }
}
