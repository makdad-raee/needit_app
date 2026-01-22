import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Account/Presentation/View/Widgets/account_view_body.dart';
import 'package:needit_app/constant.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/prefixiconprofile.svg',
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 8),
            Text(
              'Profile',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 18,
                fontFamily: kRubikBold,
              ),
            ),
          ],
        ),
      ),
      body: AccountViewBody(),
    );
  }
}
