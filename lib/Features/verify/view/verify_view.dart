import 'package:flutter/material.dart';
import 'package:needit_app/Features/verify/view/widgets/verify_view_body.dart';
import 'package:needit_app/constant.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify Email',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 18,
            fontFamily: kSwiss721Bold,
          ),
        ),
        elevation: 0,
      ),
      body: const SafeArea(child: VeriftyViewBody()),
    );
  }
}
