import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/create_pin_for)profile.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/gender_drop_button.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/profile_picture.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';
import 'package:needit_app/core/widgets/custom_text_form_field.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 50),
            ProfilePicture(),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'First Name',
              prefixIcon: SvgPicture.asset(
                'assets/images/namesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Last Name',
              prefixIcon: SvgPicture.asset(
                'assets/images/namesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Date/Birth',
              prefixIcon: SvgPicture.asset(
                'assets/images/datesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Email',
              prefixIcon: SvgPicture.asset(
                'assets/images/emailsvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Phone Number',
              prefixIcon: SvgPicture.asset(
                'assets/images/flagsvg.svg',
                colorFilter: ColorFilter.mode(
                  Colors.black26,
                  BlendMode.softLight,
                ),
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            SizedBox(height: 20),
            Container(child: GenderDropdownButton()),
            ContinueBottom(
              text: 'Save',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreatePinForProifile(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
