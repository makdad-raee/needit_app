import 'package:flutter/material.dart';
import 'package:needit_app/Features/Auth/Domain/entites/user_untity.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/profile_picture.dart';
import 'package:needit_app/constant.dart';

class AccountViewBodySection1 extends StatelessWidget {
  const AccountViewBodySection1({super.key, required this.userEntity});
  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePicture(),
        SizedBox(height: 10),
        Text(
          userEntity.name,
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
