import 'package:flutter/material.dart';
import 'package:needit_app/Features/Account/Presentation/View/Widgets/account_view_body_section1.dart';
import 'package:needit_app/Features/Account/Presentation/View/Widgets/account_view_body_section2.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: AccountViewBodySection1()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Divider(thickness: 1, color: Colors.black12),
            ),
            SizedBox(height: 26),
            AccountViewBodySection2(),
          ],
        ),
      ),
    );
  }
}
