import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/rest_password_view_body.dart';
import 'package:needit_app/constant.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fill Your Profile',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontFamily: kRubikRubikRegular,
          ),
        ),
      ),
      body: RestPasswordViewBody(),
    );
  }
}
