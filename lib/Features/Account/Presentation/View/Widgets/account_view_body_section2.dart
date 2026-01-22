import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Account/Presentation/View/Widgets/option_profile.dart';
import 'package:needit_app/Features/Profile/Presentation/View/profile_view.dart';
import 'package:needit_app/constant.dart';

class AccountViewBodySection2 extends StatelessWidget {
  const AccountViewBodySection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OptionProfile(
          svgPath: 'assets/images/profilesvg1.svg',
          text: 'Edit Profile',
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ProfileView()));
          },
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/locationsvg.svg',
          text: 'Address',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/notifbellsvg.svg',
          text: 'Notification',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/paymentsvg.svg',
          text: '  Payment',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/securitysvg.svg',
          text: 'Security',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/drakmodesvg.svg',
          text: 'Dark Mode',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/helpcenter.svg',
          text: ' Help Center',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/invitefrienfsvg.svg',
          text: ' Invite Friends',
        ),
        SizedBox(height: 22),
        OptionProfile(
          svgPath: 'assets/images/privacysecurysvg.svg',
          text: ' Privacy Policy  ',
        ),
        SizedBox(height: 22),
        LogoutButton(svgPath: 'assets/images/logoutsvg.svg', text: ' Logout  '),
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required this.text, required this.svgPath});
  final String text;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          svgPath,
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 16,
            fontFamily: kRubikRubikRegular,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
