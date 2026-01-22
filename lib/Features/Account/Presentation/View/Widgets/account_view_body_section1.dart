import 'package:flutter/material.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/profile_picture.dart';
import 'package:needit_app/constant.dart';

class AccountViewBodySection1 extends StatelessWidget {
  const AccountViewBodySection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
        SizedBox(height: 10),
        Text(
          'Nada Jbour',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 28,
          ),
        ),
        Text(
          '+963-958654282',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
